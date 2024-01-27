class AppData {
  String packageName;
  bool isLocked;

  AppData({
    required this.packageName,
    required this.isLocked,
  });

  Map<String, dynamic> toMap() {
    return {
      'packageName': packageName,
      'isLocked': isLocked,
    };
  }

  factory AppData.fromMap(Map<String, dynamic> map) {
    return AppData(
      packageName: map['packageName'],
      isLocked: map['isLocked'],
    );
  }
}
