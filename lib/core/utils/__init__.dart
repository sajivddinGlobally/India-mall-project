import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppInitializer {
  static Future<void> init() async {
    // Initialize Hive
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    await Hive.openBox("data");
  }

  // Optional: Access to commonly used boxes/services
  static Box get dataBox => Hive.box("data");
}


