import 'package:annual_tracker/app/common/constants.dart';
import 'package:annual_tracker/app/util/color_converter.dart';
import 'package:annual_tracker/app/widgets/default_loader.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../routes/app_pages.dart';
import '../../../util/logger.dart';
import '../controllers/month_controller.dart';

class MonthView extends GetView<MonthController> {
  const MonthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Obx(() {
          if (controller.isLoaded.value) {
            return TableCalendar(
              onPageChanged: (focusedDay) {
                //todo: data 가져오기 되는지 테스트
                dlog.d('focusedDay: $focusedDay');
                controller.getMonthData(focusedDay);
              },
              eventLoader: (day) {
                return controller.eventList.value;
              },
              calendarBuilders: CalendarBuilders(
                selectedBuilder: (context, day, focusedDay) {
                  return Container(
                    width: 40,
                    decoration: const BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                  );
                },
                markerBuilder: (context, date, dynamic event) {
                  String key = DateFormat(YMD).format(date);

                  double? eventVal = event[0][key];
                  if (eventVal != null) {
                    return Container(
                      width: 40,
                      decoration: BoxDecoration(
                          color: HexColor(
                            hexColor: controller.themeColor,
                            opacity: eventVal,
                          ),
                          shape: BoxShape.circle),
                    );
                  } else {
                    return Container(
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                    );
                  }
                },
              ),
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextFormatter: (date, locale) {
                  String month = DateFormat('yyyy.MM').format(date);
                  return month;
                },
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: controller.leftVisible.value
                      ? Colors.black87
                      : Colors.transparent,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: controller.rightVisible.value
                      ? Colors.black87
                      : Colors.transparent,
                ),
              ),
              firstDay: controller.firstDt,
              lastDay: controller.lastDt,
              focusedDay: controller.focusedDt.value,
              onDaySelected: (selectedDay, focusedDay) {
                String selectedDt = DateFormat(YMD).format(selectedDay);

                Get.toNamed(Routes.RECORD, arguments: {
                  'dt': selectedDt,
                  'val': controller.eventList.value[0][selectedDt]
                });
              },
            );
          } else {
            return const Center(child: DefaultLoader());
          }
        }),
      ),
    );
  }
}
