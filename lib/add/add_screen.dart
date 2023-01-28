import 'package:appd/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_view.dart';
import 'add_widget.dart';

// ignore: must_be_immutable
class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: Constant.widgetAppBar("appAdd".tr),
        body: AddView(),
        floatingActionButton: AddWidget.widgetChangeButton());
  }
}
