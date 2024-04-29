import 'package:annual_tracker/app/routes/app_pages.dart';
import 'package:annual_tracker/app/widgets/default_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'ANNUAL TRACKER 🚀🚀',
          style: TextStyle(fontSize: 25),
        ),
      ),
      bottomNavigationBar: Obx(() {
        if (controller.isLoaded()) {
          return SafeArea(
            child: GestureDetector(
              onTap: () {
                if (controller.isReg()) {
                  Get.offAndToNamed(Routes.MAIN);
                } else {
                  Get.offAndToNamed(Routes.REGISTER,
                      arguments: {'isEditMode': false});
                }
              },
              child: Container(
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(maxHeight: 50),
                  margin: const EdgeInsets.all(5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text('Get Started!')),
            ),
          );
        } else {
          return const DefaultLoader();
        }
      }),
    );
  }
}
