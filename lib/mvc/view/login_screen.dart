import 'package:appd/mvc/controller/login_controller.dart';
import 'package:appd/mvc/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => IndexedStack(
        index: loginController.stackIndex.value,
        children: [sendSMS(), login(context)],
      ),
    ));
  }

//Void sand sms take name and  phone
  sendSMS() {
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
  login(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(40),
          child: TextField(
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
              Get.off(HomeScreen());
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
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
