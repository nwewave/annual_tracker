import 'package:flutter/material.dart';

import 'colors.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration inputFormTheme = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 17.0),
  hintStyle: const TextStyle(fontSize: 16, height: 0.1),
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey, width: 0.5),
    borderRadius: BorderRadius.circular(8.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: nacoPurple, width: 1),
    borderRadius: BorderRadius.circular(8.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey, width: 0.5),
    borderRadius: BorderRadius.circular(8.0),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: nacoDividerGrey, width: 1),
    borderRadius: BorderRadius.circular(8.0),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey, width: 0.5),
    borderRadius: BorderRadius.circular(8.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey, width: 0.5),
    borderRadius: BorderRadius.circular(8.0),
  ),
);
