import 'package:annual_tracker/app/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';


class RegisterController extends GetxController {
  RxBool isLoaded = false.obs;
  final box = GetStorage();
  bool isEditMode = Get.arguments?['isEditMode'] ?? false;

  final title = RxString("");
  TextEditingController titleEditCtrl = TextEditingController();

  DateTime initDate = DateTime.now();
  final selectedDt = Rx<DateTime>(DateTime.now());
  final selectedDtStr = Rx<String>('');

  List colorList = ['#884dff', '#afb83b', '#ccac93', '#808080'];
  final selectedColor = Rx<String>('');

  @override
  Future<void> onInit() async {
    if (box.read(TITLE) != null) {
      title.value = box.read(TITLE);
      titleEditCtrl = TextEditingController(text: box.read(TITLE));
    }
    if (box.read(START_DT) != null) {
      selectedDtStr.value = box.read(START_DT);
      selectedDt.value = DateTime.parse(box.read(START_DT));
    }
    if (box.read(COLOR) != null) {
      selectedColor.value = box.read(COLOR);
    }
    isLoaded(true);
    selectedDtStr.value = DateFormat(YMD).format(initDate);

    super.onInit();
  }

  void onDateTimeChanged(DateTime dt) {
    selectedDt.value = dt;
    selectedDtStr.value = DateFormat(YMD).format(dt);
  }

  void onColorChanged(String val) {
    selectedColor.value = val;
  }

  Map<String, double> generateNewTracker() {
    DateTime tmpDt = selectedDt.value;
    int i = 368;
    Map<String, double> doubleWeeks = {};
    while (i > 0) {
      String dtItem = DateFormat(YMD).format(tmpDt);
      doubleWeeks[dtItem] = 0;
      tmpDt = tmpDt.add(const Duration(days: 1));
      i--;
    }
    return doubleWeeks;
  }

  void save() {
    box.write(TITLE, title.value);
    box.write(START_DT, selectedDtStr.value);
    box.write(COLOR, selectedColor.value);
    Map<String, double> tmp = generateNewTracker();
    box.write(DATA, tmp);
  }

  void reset() {
    // RegisterController().reset();
    box.erase();
    Get.deleteAll();
  }
}
