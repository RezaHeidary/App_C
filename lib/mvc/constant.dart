import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Constant {
  Constant._();

  static final btnStyle = ButtonStyle(
      fixedSize:
          MaterialStateProperty.all(Size(Get.width / 1.2, Get.height / 15)),
      backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ));

  static widgetAppBar(str) {
    return AppBar(
      backgroundColor: Colors.pink,
      title: Center(
          child: Text(
        str,
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
