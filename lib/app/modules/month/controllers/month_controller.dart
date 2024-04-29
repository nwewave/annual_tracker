import 'package:annual_tracker/app/common/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../util/logger.dart';

class MonthController extends GetxController {
  final box = GetStorage();
  static MonthController get to => Get.find();
  RxBool isLoaded = false.obs;
  Rx<DateTime> focusedDt = DateTime.now().obs;
  DateTime firstDt = DateTime.now();
  DateTime lastDt = DateTime.now();
  Map<String, double> args = Get.arguments['month'];
  final eventList = Rx<List<Map<String, dynamic>>>([]);
  late final themeColor;
  RxBool leftVisible = true.obs;
  RxBool rightVisible = true.obs;

  @override
  void onInit() {
    themeColor = box.read(COLOR);
    setDt();
    getMonthData(focusedDt.value); //warn: timing issue
    isLoaded.value = true;
    super.onInit();
  }

  void setDt() {
    firstDt = DateTime.parse(box.read(START_DT));
    lastDt = firstDt.add(const Duration(days: 367));
    focusedDt.value = DateTime.parse(args.keys.first);
  }

  void getMonthData(DateTime changedDt) {
    //이전 다음 달력 넘길 수 있는지 체크

    if (changedDt.month == firstDt.month && changedDt.year == firstDt.year) {
      leftVisible.value = false;
    } else {
      leftVisible.value = true;
    }
    if (changedDt.month == lastDt.month && changedDt.year == lastDt.year) {
      rightVisible.value = false;
    } else {
      rightVisible.value = true;
    }
    //해당 월에 해당하는 데이터 가져오기
    eventList.value = [];
    Map<String, dynamic> tmpEvent = {};
    String targetMonth = DateFormat('MM').format(changedDt);
    Map<String, dynamic> data = box.read(DATA);

    for (var dt in data.keys) {
      if (dt.contains('-$targetMonth-')) {
        tmpEvent[dt] = data[dt];
      }
    }

    eventList.value = [tmpEvent];
    dlog.d('eventList: $eventList');
    focusedDt.value = changedDt;
  }
}
