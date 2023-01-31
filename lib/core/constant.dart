import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class Constant {
  Constant._();

  static final btnStyle = ButtonStyle(
      fixedSize:
          MaterialStateProperty.all(Size(Get.width / 1.2, Get.height / 15)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ));

  static widgetAppBar(str) {
    return AppBar(
      title: Text(
        str,
        style: TextStyle(fontSize: 30),
      ),
      centerTitle: true,
    );
  }

  static String api = dotenv.get("API_HOST", fallback: "");
}
