import 'package:annual_tracker/app/common/text_style.dart';
import 'package:annual_tracker/app/widgets/default_dialog.dart';
import 'package:annual_tracker/app/widgets/default_loader.dart';
import 'package:annual_tracker/app/widgets/default_sized_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../util/color_converter.dart';
import '../../../widgets/default_bottom_navigation_button.dart';
import '../../main/controllers/main_controller.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Year Goal'),
        centerTitle: true,
        actions: controller.isEditMode
            ? [
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {
                      controller.save();
                      MainController.to.getFromStorage();
                      Get.back();
                    },
                    child: Text(
                      'Save',
                      style: title.copyWith(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              ]
            : null,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(19.0),
          height: Get.height,
          width: Get.width,
          color: Colors.transparent,
          child: Obx(() {
            if (controller.isLoaded.value) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Title',
                    style: title,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'title',
                    ),
                    controller: controller.titleEditCtrl,
                    onChanged: (val) {
                      controller.title.value = val;
                    },
                  ),
                  boxH(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Start Date',
                        style: title,
                      ),
                      boxW(10),
                      GestureDetector(
                        onTap: () {
                          if (controller.isEditMode) {
                            return;
                          } else {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (_) {
                                  return SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24, vertical: 20),
                                          child: Text(
                                            'Select the date you started',
                                            style: title.copyWith(fontSize: 20),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 200,
                                          child: CupertinoDatePicker(
                                            minimumYear: 2000,
                                            maximumYear: DateTime.now().year,
                                            initialDateTime:
                                                controller.initDate,
                                            maximumDate: DateTime.now(),
                                            onDateTimeChanged:
                                                controller.onDateTimeChanged,
                                            mode: CupertinoDatePickerMode.date,
                                          ),
                                        ),
                                        boxH(15),
                                        DefaultBtNaviBtn(
                                          onTap: () => Get.back(),
                                          label: 'Confirm!',
                                        )
                                      ],
                                    ),
                                  );
                                });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            controller.selectedDtStr.value,
                            style: dateBtn.copyWith(
                              color: controller.isEditMode
                                  ? Colors.grey
                                  : Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  boxH(15),
                  Text(
                    'Theme Color',
                    style: title,
                  ),
                  boxH(10),
                  SizedBox(
                    height: 50,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            controller
                                .onColorChanged(controller.colorList[index]);
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: HexColor(
                                        hexColor: controller.colorList[index]),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              Obx(() {
                                if (controller.selectedColor() ==
                                    controller.colorList[index]) {
                                  return const Positioned(
                                    left: 0,
                                    top: 0,
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Icon(
                                        Icons.check,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                } else {
                                  return boxH(0);
                                }
                              })
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(width: 10),
                      itemCount: controller.colorList.length,
                    ),
                  ),
                ],
              );
            } else {
              return const DefaultLoader();
            }
          }),
        ),
      ),
      bottomNavigationBar: controller.isEditMode
          ? DefaultBtNaviBtn(
              onTap: () {
                showDefaultDialog(
                  title: 'Do you want to reset?',
                  onTap: () {
                    controller.reset();
                    Get.offAndToNamed(Routes.HOME);
                  },
                );
              },
              label: 'Reset', //todo: color to red
            )
          : DefaultBtNaviBtn(
              onTap: () {
                controller.save();

                Get.offAndToNamed(Routes.MAIN);
              },
              label: 'Confirm!',
            ),
    );
  }
}
