import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopper/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopper/firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shopper/data/repositories/authenticationRepository.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  // This code snippet is used to intentionally keep the native splash screen visible on the user's screen while your app is loading data or performing asynchronous setup in the background.
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Resists it from portrait mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(AuthenticationRepository());
  });
  runApp(const MyApp());
}
