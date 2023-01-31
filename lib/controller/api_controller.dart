import 'package:appd/model/model.dart';
import 'package:get/get.dart';
import '../core/constant.dart';
import '../service/dio_service.dart';

class ApiController extends GetxController {
  var loading = true.obs;
  RxList<HomeAndEditModel> homeModleList = RxList();
  @override
  onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    loading.value = true;
    homeModleList.clear();
    final response = await DioService().getMethod(Constant.api);

    await response.data["data"].forEach((val) {
      homeModleList.add(HomeAndEditModel.fromJson(val));
    });

    loading.value = false;
  }
}
