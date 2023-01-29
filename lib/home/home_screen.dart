import 'package:appd/core/constant.dart';
import 'package:appd/home/controller/home_api_controller.dart';
import 'package:appd/home/home_view.dart';
import 'package:appd/home/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  HomeApiController homeApiController = Get.put(HomeApiController());
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
