import 'package:desti_alert/bindings/all_controllers_binding.dart';
import 'package:desti_alert/modules/home/views/onboard_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllControllesBindings(),
      debugShowCheckedModeBanner: false,
      home: const OnBoardScreen(),
    );
  }
}
