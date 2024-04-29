import 'package:get/get.dart';

import '../controllers/month_controller.dart';

class MonthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonthController>(
      () => MonthController(),
    );
  }
}
