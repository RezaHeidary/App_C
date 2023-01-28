import 'package:appd/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../service/internet_connection_checker.dart';

class LoginController extends GetxController {
  var stackIndex = 0.obs;
  var message;
  var textEditingControllerCode = TextEditingController().obs;

  getForLogin() {
    getToken();
    stackIndex.value = 1;
  }

  getBack() {
    stackIndex.value = 0;
  }

  getToken() async {
    print("token ::::: ");
    await Firebase.initializeApp();
    var sms = FirebaseMessaging.instance;
    var token = await sms.getToken();
    print(token);
    getMessaging();
  }

  getMessaging() async {
    await FirebaseMessaging.onMessage.listen((event) {
      message = event.data["pass"];
      print(event.data["pass"]);
    });
  }

  getCheckCodeForLogin() {
    message == textEditingControllerCode.value.text
        ? Get.offAll(HomeScreen())
        : null;
    if (message == textEditingControllerCode.value.text) {
      GetStorage().write("isLogin", "true");
      Get.offAll(HomeScreen());
    }
  }

  getServiceInternet() async {
    await InternetConnection.serviesInternetConnectionChecker()
        ? null
        : getDefaultDialogForInternet();
  }

  getDefaultDialogForInternet() {
    Get.defaultDialog(
        barrierDismissible: false,
        title: "ER",
        content: Center(
            child: Text(
          "Test the Internet",
          style: TextStyle(fontSize: 25),
        )),
        confirm: TextButton(
            onPressed: () {
              Get.back();
              getServiceInternet();
            },
            child: Text("Ok")));
  }

  @override
  void onInit() {
    super.onInit();
    getServiceInternet();
  }
}
