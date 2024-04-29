import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/constants.dart';
import '../../../routes/app_pages.dart';

class RootController extends GetxController {
  final box = GetStorage();

  @override
  void onReady() {
    Future.delayed(Duration.zero, () {
      if (box.read(TITLE) != null &&
          box.read(START_DT) != null &&
          box.read(COLOR) != null) {
        Get.offAndToNamed(Routes.MAIN);
      } else {
        Get.offAndToNamed(Routes.HOME);
      }
    });

    super.onReady();
  }
}
