import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => HomeWidget.apiController.homeModleList.length == 0
          ? Center(child: Text("Add Text"))
          : ListView.builder(
              itemCount: HomeWidget.apiController.homeModleList.length,
              itemBuilder: ((context, index) =>
                  HomeWidget.widgetAddListView(index))),
    );
  }
}
