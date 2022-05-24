import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    signInAnonymously();
  }

  void signInAnonymously() async {
    var _auth = await FirebaseAuth.instance.signInAnonymously();
    debugPrint(_auth.user!.uid.toString());
    debugPrint(FirebaseAuth.instance.currentUser!.uid.toString());
  }
}
