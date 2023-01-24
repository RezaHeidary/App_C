import 'package:appd/mvc/constant.dart';
import 'package:appd/mvc/view/add_pages/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Constant.widgetAppBar("Home"),
      body: widgetListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
        onPressed: () {
          Get.to(
            AddScreen(),
          );
        },
      ),
    );
  }

//widget ListView
  widgetListView() {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: Get.width,
                  height: Get.height / 10,
                  decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(20)),
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
            )));
  }
}
