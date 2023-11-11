import 'package:flutter/material.dart';
import 'package:ulearning_app/common/service/storage_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ulearning_app/routes/names.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();

    storageService = await StorageService().init();
  }

  static String initPage() {
    if (Global.storageService.getDeviceFirstOpen() == false) {
      return welcomePage;
    } else if (Global.storageService.getDeviceFirstOpen() == true &&
        Global.storageService.isLoggedIn() == false) {
      return signInPage;
    } else {
      return appPage;
    }
  }
}
