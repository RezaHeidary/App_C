import 'dart:developer';
import 'package:appd/add/add_model.dart';
import 'package:appd/add/controller/add_controller.dart';
import 'package:appd/controller/api_controller.dart';
import 'package:appd/editor/editor_controller.dart';
import 'package:appd/service/dio_service.dart';
import 'package:get/get.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../../core/constant.dart';

class AddApiController extends GetxController {
  AddController addController = Get.put(AddController());
  EidtorController eidtorController = Get.put(EidtorController());
  ApiController apiController = Get.put(ApiController());

  getAddPost() async {
    var mapAdd = {
      "data": {
        AddModel.title: addController.title.value.toString(),
        AddModel.body: eidtorController.body.value.toString(),
        AddModel.date:
            "${Jalali.now().year}/${Jalali.now().month}/${Jalali.now().day}",
      }
    };

    var response = await DioService().postMethod(mapAdd, Constant.api);
    log(response.data.toString());
  }
}
