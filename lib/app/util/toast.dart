import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

const serverConnectErrorMsg = '서버와의 통신에 문제가 있습니다. 나중에 다시 시도해 주세요.';

void errorToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: Colors.red,
    fontSize: 16.0,
  );
}

void serverConnectErrorToast() {
  Fluttertoast.showToast(
      msg: serverConnectErrorMsg,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.red,
      fontSize: 16.0);
}

void basicToast({
  required Widget message,
  Color backgroundColor = const Color.fromARGB(100, 67, 67, 67),
  EdgeInsets margin = const EdgeInsets.all(0),
}) {
  if (Get.isSnackbarOpen) return;
  Get.rawSnackbar(
    messageText: message,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    backgroundColor: backgroundColor,
    shouldIconPulse: false,
    maxWidth: Get.width - 32,
    borderRadius: 8,
    margin: margin,
  );
}
