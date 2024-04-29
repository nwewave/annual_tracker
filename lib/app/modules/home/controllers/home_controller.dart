import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/constants.dart';

class HomeController extends GetxController {
  RxBool isLoaded = false.obs;
  final box = GetStorage();
  final isReg = RxBool(false);
  @override
  void onInit() {
    if (box.read(TITLE) != null &&
        box.read(START_DT) != null &&
        box.read(COLOR) != null) {
      isReg.value = true;
    }
    isLoaded.value = true;
    super.onInit();
  }
}
