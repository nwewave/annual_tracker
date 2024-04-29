import 'package:annual_tracker/app/routes/app_pages.dart';
import 'package:annual_tracker/app/widgets/default_loader.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../util/color_converter.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () =>
                Get.toNamed(Routes.REGISTER, arguments: {'isEditMode': true}),
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              child: const Icon(
                Icons.settings,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Obx(() {
            if (controller.isLoaded.value) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.tracker.value.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: controller.tracker.value[index].length,
                      itemBuilder: (BuildContext context, int index2) {
                        Map<String, double> item =
                            controller.tracker.value[index][index2];

                        return GestureDetector(
                          onTap: () => Get.toNamed(Routes.MONTH,
                              arguments: {'month': item}),
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                color: HexColor(
                                  hexColor: controller.themeColor.value,
                                  opacity: controller.tracker
                                      .value[index][index2].values.first,
                                ),
                                border: Border.all(
                                  color: HexColor(
                                    hexColor: controller.themeColor.value,
                                    opacity: 0.3,
                                  ),
                                )),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            } else {
              return const DefaultLoader();
            }
          }),
        ),
      ),
    );
  }
}
