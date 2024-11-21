import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/notifications/notification_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  await FirebaseMessagingHandler().initPushNotification();
  await FirebaseMessagingHandler().initLocalNotification();
  runApp(
    GetMaterialApp(
      title: "TickFlix",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
