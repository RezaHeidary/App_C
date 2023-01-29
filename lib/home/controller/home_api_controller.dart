import 'package:appd/home/home_model.dart';
import 'package:get/get.dart';

import '../../service/dio_service.dart';

class HomeApiController extends GetxController {
  var loading = false.obs;
  RxList<HomeModel> homeModleList = RxList();
  @override
  onInit() async {
    super.onInit();
    await getList();
  }

  getList() async {
    loading.value = true;
    var response =
        await DioService().getMethod("http://192.168.1.82:1337/api/notpads");

    print("ok");

    response.body.forEach((element) {
      homeModleList.add(HomeModel.fromJson(element));
    });

    loading.value = false;
  }
}
