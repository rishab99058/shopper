import 'package:flutter/material.dart';
import 'package:shopper/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopper/firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
