import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../common/constants.dart';
import '../../../util/logger.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();
  RxBool isLoaded = false.obs;
  RxBool needUpdate = false.obs;
  final box = GetStorage();
  late final title = RxString('');
  late final themeColor = RxString('');

  final tracker = Rx<List<List<Map<String, double>>>>([
    [{}]
  ]);

  @override
  void onInit() {
    dlog.d('oniinit: }');
    getFromStorage();
    isLoaded(true);

    ever(needUpdate, (_) => getFromStorage());

    super.onInit();
  }

  void getFromStorage() {
    title.value = box.read(TITLE);
    themeColor.value = box.read(COLOR);

    generatingTracker(box.read(DATA));
  }

  void generatingTracker(Map<String, dynamic> data) {
    dlog.d('data: $data');
    String startDtStr = box.read(START_DT);
    DateTime startDt = DateTime.parse(startDtStr);
    tracker.value = List.generate(
        23,
        (index) => List.generate(16, (index2) {
              String key = DateFormat(YMD).format(startDt);
              double value = data[key];
              startDt = startDt.add(const Duration(days: 1));
              return {key: value};
            }));
    dlog.d('tracker: $tracker');
  }
}
