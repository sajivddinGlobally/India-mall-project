import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppInitializer {
  static Future<void> init() async {
    // Initialize Hive
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    try {
    await Hive.initFlutter();
    if (!Hive.isBoxOpen('data')) {
      await Hive.openBox('data');
    }
  } catch (e) {
    log("Hive initialization failed: $e");
  }
  }

  // Optional: Access to commonly used boxes/services
  static Box get dataBox => Hive.box("data");
}


