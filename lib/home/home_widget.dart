import 'package:appd/home/controller/home_controller.dart';
import 'package:appd/home/controller/home_drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../add/add_screen.dart';
import 'package:shamsi_date/shamsi_date.dart';

class HomeWidget {
  HomeWidget._();

  static HomeController homeController = Get.put(HomeController());
  static HomeDrawerController homeDrawerController =
      Get.put(HomeDrawerController());

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
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                  "${Jalali.now().year.toString()}/${Jalali.now().month.toString()}/${Jalali.now().day.toString()}",
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
      onPressed: () {
        Get.to(
          AddScreen(),
        );
      },
    );
  }

  // Drawer For local and theme
  static widgetHomeDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(),
            child: Text('Seting'),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Languegs'),
                Obx(
                  () => Switch(
                    value: homeDrawerController.flagLocal.value,
                    onChanged: (value) {
                      homeDrawerController.flagLocal.value = value;
                      homeDrawerController.getLocal();
                    },
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Thmes'),
                Obx(() => Switch(
                      value: homeDrawerController.flagTheme.value,
                      onChanged: (value) {
                        homeDrawerController.flagTheme.value = value;
                        homeDrawerController.getTheme();
                      },
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
