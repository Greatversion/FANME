import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fanme/database/dataModel.dart';

class AppDataService {
  final CollectionReference<Map<String, dynamic>> _collection =
      FirebaseFirestore.instance.collection('apps');

  Future<void> addAppData(AppData appData, bool isLocked) async {
    // Add the app data to the main 'apps' collection
    final DocumentReference<Map<String, dynamic>> mainDocRef =
        await _collection.add(appData.toMap());

    // Determine the subcollection based on the lock status
    final String subcollectionName =
        isLocked ? 'locked_status' : 'unlocked_status';
    final CollectionReference<Map<String, dynamic>> subcollection =
        mainDocRef.collection(subcollectionName);

    // Add the lock/unlock status with timestamp to the subcollection using current timestamp as document ID
    await subcollection.doc(DateTime.now().toString()).set({
      'time': DateTime.now(),
      'isLocked': isLocked,
    });
  }

  Future<void> updateAppLockStatus(String packageName, bool isLocked) async {
    // Determine the subcollection based on the lock status
    final String subcollectionName =
        isLocked ? 'locked_status' : 'unlocked_status';

    // Add/update the lock/unlock status with timestamp to the subcollection using current timestamp as document ID
    await _collection
        .doc(packageName)
        .collection(subcollectionName)
        .doc(DateTime.now().toString())
        .set({
      'time': DateTime.now(),
      'isLocked': isLocked,
    });
  }

  Future<AppData?> getAppData(String packageName) async {
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _collection.doc(packageName).get();

    if (snapshot.exists) {
      // Construct AppData object
      AppData appData = AppData.fromMap(snapshot.data()!);

      // Fetch lock status documents from 'locked_status' subcollection
      QuerySnapshot<Map<String, dynamic>> lockedStatusSnapshot =
          await _collection
              .doc(packageName)
              .collection('locked_status')
              .get();

      // Update lock status in AppData object
      appData.isLocked = lockedStatusSnapshot.docs.isNotEmpty;
      return appData;
    } else {
      return null;
    }
  }

  Future<void> deleteAppData(String packageName) async {
    // Delete the main document from 'apps' collection
    await _collection.doc(packageName).delete();

    // Delete all documents from 'locked_status' and 'unlocked_status' subcollections
    QuerySnapshot<Map<String, dynamic>> lockedAppsSnapshot =
        await _collection.doc(packageName).collection('locked_status').get();
    for (DocumentSnapshot<Map<String, dynamic>> doc in lockedAppsSnapshot.docs) {
      await doc.reference.delete();
    }

    QuerySnapshot<Map<String, dynamic>> unlockedAppsSnapshot =
        await _collection.doc(packageName).collection('unlocked_status').get();
    for (DocumentSnapshot<Map<String, dynamic>> doc
        in unlockedAppsSnapshot.docs) {
      await doc.reference.delete();
    }
  }
}