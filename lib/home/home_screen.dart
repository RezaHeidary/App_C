import 'package:appd/core/constant.dart';
import 'package:appd/home/home_view.dart';
import 'package:appd/home/home_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Constant.widgetAppBar("Home"),
        body: HomeView(),
        floatingActionButton: HomeWidget.widgetButtonAddText());
  }
}
