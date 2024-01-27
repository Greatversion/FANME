import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:fanme/database/dataModel.dart';
import 'package:fanme/database/crud.dart';

class AllDeviceApps extends StatefulWidget {
  const AllDeviceApps({Key? key}) : super(key: key);

  @override
  State<AllDeviceApps> createState() => _AllDeviceAppsState();
}

class _AllDeviceAppsState extends State<AllDeviceApps> {
  List<ApplicationWithIcon> appsWithIcons = [];
  Map<String, bool> appLockStatus = {};
  bool _isLoaded = false;

  final AppDataService _appDataService = AppDataService();

  @override
  void initState() {
    super.initState();
    getAppsAndLockStatus();
  }

  Future<void> getAppsAndLockStatus() async {
    if (!_isLoaded) {
      // Fetch installed applications
      List<Application> allApps = await DeviceApps.getInstalledApplications(
        includeAppIcons: true,
        onlyAppsWithLaunchIntent: true,
        includeSystemApps: true,
      );

      // Load app lock status from Firestore and filter locked apps
      for (Application app in allApps) {
        AppData? data = await _appDataService.getAppData(app.packageName);
        bool isLocked = data?.isLocked ?? false;
        appsWithIcons.add(app as ApplicationWithIcon);
        appLockStatus[app.packageName] = isLocked;
      }

      setState(() {
        _isLoaded = true;
      });
    }
  }

  void toggleLockStatus(String packageName) async {
    bool isLocked = !(appLockStatus[packageName] ?? false);
    appLockStatus[packageName] = isLocked;
    // Update lock status in Firestore
    await _appDataService.updateAppLockStatus(packageName, isLocked);
    setState(() {}); // Update the UI
  }

  @override
  Widget build(BuildContext context) {

 
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Device Apps"),
        backgroundColor: const Color.fromARGB(255, 200, 93, 0),
      ),
      body: appsWithIcons.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
              color: Colors.black,
              child: ListView.builder(
                itemCount: appsWithIcons.length,
                itemBuilder: (context, index) {
                  ApplicationWithIcon app = appsWithIcons[index];
                  bool isLocked = appLockStatus[app.packageName] ?? false;

                  return ListTile(
                    leading: Image.memory(app.icon),
                    title: Text(
                      app.appName,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        toggleLockStatus(app.packageName);
                      },
                      icon: Icon(
                        isLocked ? Icons.lock : Icons.lock_open,
                        color: isLocked ? Colors.red : Colors.green,
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
