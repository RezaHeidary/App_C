import 'dart:developer';
import 'package:appd/controller/api_controller.dart';
import 'package:appd/core/constant.dart';
import 'package:appd/edit/add/controller/edit_controller.dart';
import 'package:appd/edit/add/edit_model.dart';
import 'package:appd/editor/editor_controller.dart';
import 'package:appd/service/dio_service.dart';
import 'package:get/get.dart';
import 'package:shamsi_date/shamsi_date.dart';

class EditApiController extends GetxController {
  EditController editController = Get.put(EditController());
  EidtorController eidtorController = Get.put(EidtorController());
  ApiController apiController = Get.put(ApiController());

  getAddPut(index) async {
    var mapAdd = {
      "data": {
        EditModel.title: editController.title.value.toString(),
        EditModel.body: eidtorController.body.value.toString(),
        EditModel.date:
            "${Jalali.now().year}/${Jalali.now().month}/${Jalali.now().day}",
      }
    };

    print(apiController.homeModleList[index].id);
    var response = await DioService().putMethod(mapAdd,
        "${Constant.api}${apiController.homeModleList[index].id.toString()}");
    log(response.data.toString());
  }

  getDelete(index) async {
    print(apiController.homeModleList[index].id);
    var response = await DioService().deleteMethod(
        "${Constant.api}${apiController.homeModleList[index].id.toString()}");
    log(response.data.toString());
  }
}
