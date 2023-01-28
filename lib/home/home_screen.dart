import 'package:appd/core/constant.dart';
import 'package:appd/home/home_view.dart';
import 'package:appd/home/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: HomeWidget.widgetHomeDrawer(),
        appBar: Constant.widgetAppBar("appHome".tr),
        body: WillPopScope(
          onWillPop: () async {
            HomeWidget.homeController.getDefaultDialogFor();
            return false;
          },
          child: HomeView(),
        ),
        floatingActionButton: HomeWidget.widgetButtonAddText());
  }
}
