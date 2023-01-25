import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var stackIndex = 0.obs;
  var acs = ActionCodeSettings(
      // URL you want to redirect back to. The domain (www.example.com) for this
      // URL must be whitelisted in the Firebase Console.
      url: 'https://www.example.com/finishSignUp?cartId=1234',
      // This must be true
      handleCodeInApp: true,
      androidPackageName: 'com.example.android',
      // installIfNotAvailable
      // androidInstallApp: true,
      // minimumVersion
      androidMinimumVersion: '12');

  getForLogin() {
    stackIndex.value = 1;
  }

  getBack() {
    stackIndex.value = 0;
  }

  @override
  void onInit() {
    super.onInit();
    getToken();
  }

  getToken() async {
    print("token ::::: ");
    await WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

    var sms = FirebaseMessaging.instance;
    var token = await sms.getToken();
    print(token);

    //   await FirebaseAuth.instance.signInWithEmailAndPassword(
    //     password: 'rrezah433',
    //     email: "rrezah2702@gmail.comm",
    //   );

    //   await FirebaseAuth.instance.sendSignInLinkToEmail(
    //     actionCodeSettings: await acs,
    //     email: "rrezah4338@gmail.comm",
    //   );
    // }
  }
}
