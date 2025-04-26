// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:smart_condo/app.dart';
// import 'package:smart_condo/data/repositories/authentication.dart';
// import 'package:smart_condo/firebase_options.dart';
// import 'package:smart_condo/navigation_menu.dart';

// Future<void> main() async {
//   // Widgets Binding
//   final WidgetsBinding widgetsBinding =
//       WidgetsFlutterBinding.ensureInitialized();

//   // Getx local storage
//   await GetStorage.init();
//   // Await Splash until other items load
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

//   // Todo: Await Native Splash
//   // Initialize Firebase & Authentication Repository

//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
//       .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
//   WidgetsFlutterBinding.ensureInitialized();

//   // ✅ تسجيل NavigationController هنا لتجنب إعادة إنشائه عدة مرات
//   Get.put(NavigationController());
//   runApp(const App());
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_condo/app.dart';
import 'package:smart_condo/data/repositories/authentication.dart';
import 'package:smart_condo/firebase_options.dart';
import 'package:smart_condo/navigation_menu.dart';

Future<void> main() async {
  // تهيئة الربط بين Flutter ومحرك التطبيقات
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // تفعيل الـ Splash مؤقتًا أثناء التحميل
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // تهيئة التخزين المحلي باستخدام GetStorage
  await GetStorage.init();

  // تهيئة Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // تفعيل App Check (مؤقتًا بنمط debug)
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );

  // تهيئة Authentication Repository
  Get.put(AuthenticationRepository());

  // تهيئة Navigation Controller لتفادي تكرار الإنشاء
  Get.put(NavigationController());

  // تشغيل التطبيق
  runApp(const App());
}
