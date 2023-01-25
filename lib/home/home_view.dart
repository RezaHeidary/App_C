import 'package:flutter/material.dart';
import 'home_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: ((context, index) => HomeWidget.widgetAddListView()));
  }
}
