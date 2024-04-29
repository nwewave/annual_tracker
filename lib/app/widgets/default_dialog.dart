import 'package:flutter/material.dart';
import 'package:get/get.dart';

showDefaultDialog({
  required String title,
  String? subTitle,
  String? successText = '확인',
  required Function() onTap,
  bool? hasCancelBtn = true,
}) {
  return showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Container(
            height: 142,
            width: 252,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        // '변경된 내용이 있습니다.',
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'AppleSDGothicNeo',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      subTitle != null
                          ? Text(
                              subTitle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'AppleSDGothicNeo',
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    color: Color(0xffe2e2e2),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    hasCancelBtn ?? true
                        ? Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: 41,
                                color: Colors.transparent,
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '취소',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    Expanded(
                      child: InkWell(
                        onTap: onTap,
                        child: Container(
                          height: 41,
                          color: Colors.transparent,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                successText ?? 'confirm',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
