import 'package:annual_tracker/app/util/color_converter.dart';
import 'package:annual_tracker/app/widgets/default_loader.dart';
import 'package:annual_tracker/app/widgets/default_sized_box.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../util/logger.dart';
import '../controllers/record_controller.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RecordView extends GetView<RecordController> {
  const RecordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.dateTitle),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => controller.setMax(),
                    child: Icon(
                      Icons.mood,
                      size: 36,
                      color: HexColor(hexColor: controller.themeColor),
                    ),
                  ),
                  Obx(() => SizedBox(
                        height: 500,
                        child: SfSlider.vertical(
                          min: 0,
                          max: 100,
                          value: controller.amount.value,
                          interval: 20,
                          showTicks: true,
                          showLabels: true,
                          enableTooltip: true,
                          minorTicksPerInterval: 1,
                          onChanged: (dynamic value) {
                            controller.amount.value =
                                double.parse(value.toStringAsFixed(1));
                            dlog.d(
                                'controller.amount.value: ${controller.amount.value}');
                          },
                          activeColor:
                              HexColor(hexColor: controller.themeColor),
                          inactiveColor: HexColor(
                              hexColor: controller.themeColor, opacity: 0.2),
                        ),
                      )),
                  GestureDetector(
                    onTap: () => controller.setMin(),
                    child: Icon(
                      Icons.mood_bad,
                      size: 36,
                      color: HexColor(hexColor: controller.themeColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(() {
            if (!controller.isLoaded.value) {
              return Positioned(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(50, 50, 50, 0.1),
                  ),
                  child: const DefaultLoader(),
                ),
              );
            } else {
              return boxH(0);
            }
          })
        ],
      ),
    );
  }
}
