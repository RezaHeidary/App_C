import 'package:get/get.dart';

class LoginController extends GetxController {
  var stackIndex = 0.obs;

  getForLogin() {
    stackIndex.value = 1;
  }

  getBack() {
    stackIndex.value = 0;
  }
}
