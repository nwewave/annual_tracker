import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/constants.dart';
import '../../../util/logger.dart';
import '../../../util/toast.dart';
import '../../main/controllers/main_controller.dart';
import '../../month/controllers/month_controller.dart';

class RecordController extends GetxController {
  final box = GetStorage();
  RxBool isLoaded = false.obs;
  late final themeColor;
  late final dateTitle;
  final amount = RxDouble(0);
  @override
  void onInit() {
    dlog.d('Get.arguments: ${Get.arguments}');
    dateTitle = Get.arguments['dt'];
    amount.value = Get.arguments['val'] * 100;
    themeColor = box.read(COLOR);
    isLoaded.value = true;
    // dateTitle에 해당하는 값을 가져와서 초반 값 셋 해줘야 함
    ever(amount, (_) {
      isLoaded.value = false;
      Map<String, dynamic> oldVal = box.read(DATA);
      double newAmount = double.parse((amount.value / 100).toStringAsFixed(1));
      Map<String, dynamic> newVal = {...oldVal, dateTitle: newAmount};
      dlog.d('newVal: $newVal');
      box.write(DATA, newVal);
      DateTime targetDt = DateTime.parse(dateTitle);
      MonthController.to.getMonthData(targetDt);
      // MainController.to.generatingTracker(newVal);
      MainController.to.onInit();
      Timer(const Duration(seconds: 1), () {
        basicToast(
          message: const Text(
            'recorded!',
            style: TextStyle(color: Colors.white),
          ),
        );
        isLoaded.value = true;
      });
    });

    super.onInit();
  }

  void setMax() {
    amount.value = 100;
  }

  void setMin() {
    amount.value = 0;
  }
}
