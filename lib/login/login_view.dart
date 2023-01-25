import 'package:appd/login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: LoginWidget.loginController.stackIndex.value,
        children: [LoginWidget.sendSMS(), LoginWidget.login(context)],
      ),
    );
  }
}
