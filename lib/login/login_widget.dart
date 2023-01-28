import 'package:appd/core/constant.dart';
import 'package:appd/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWidget {
  LoginWidget._();

  static LoginController loginController = Get.put(LoginController());

//Void sand sms take name and  phone
  static sendSMS() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(25),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Name",
            ),
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Phone",
            ),
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 80,
        ),
        ElevatedButton(
            onPressed: () {
              loginController.getForLogin();
            },
            child: Text(
              "Send SMS",
              style: TextStyle(fontSize: 25),
            ),
            style: Constant.btnStyle)
      ],
    );
  }

//take sms and login
  static login(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(40),
          child: TextField(
            controller: loginController.textEditingControllerCode.value,
            decoration: InputDecoration(
              hintText: "Code",
            ),
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 80,
        ),
        ElevatedButton(
            onPressed: () {
              loginController.getCheckCodeForLogin();
            },
            child: Text(
              "Login",
              style: TextStyle(fontSize: 25),
            ),
            style: Constant.btnStyle),
        SizedBox(
          height: 80,
        ),
        TextButton(
          onPressed: () {
            loginController.getBack();
          },
          child: Text(
            "back",
          ),
        ),
      ],
    );
  }
}
