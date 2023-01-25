import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../add/add_screen.dart';

class HomeWidget {
  HomeWidget._();

  //widget add to ListView
  static widgetAddListView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: Get.width,
          height: Get.height / 10,
          decoration: BoxDecoration(
              color: Colors.pink[100], borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Text",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  "Date",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //widget  floatingActionButton for add text
  static widgetButtonAddText() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.pink,
      onPressed: () {
        Get.to(
          AddScreen(),
        );
      },
    );
  }
}
