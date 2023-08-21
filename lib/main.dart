import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/data/data_source/remote_data_source/firebase_options.dart';
import 'src/app.dart';
import 'src/injector.dart';

void main() async {
  await globalInstances();
  profilInstances();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    DevicePreview(
        backgroundColor: Colors.blue,
        isToolbarVisible: false,
        enabled: true,
        builder: (context) => const MyApp()), // Wrap your app
  ); // Wrap your app
}
