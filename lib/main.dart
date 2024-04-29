import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/common/app_styles.dart';
import 'app/common/constants.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 767),
      minTextAdapt: true,
      builder: (context, child) {
        final box = GetStorage();
        String initialPage = box.read(TITLE) != null &&
                box.read(START_DT) != null &&
                box.read(COLOR) != null
            ? Routes.MAIN
            : Routes.HOME;
        return GetMaterialApp(
          title: 'Annual Tracker',
          initialRoute: initialPage,
          getPages: AppPages.routes,
          theme: appStyle,
          locale: const Locale('ko', 'KR'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ko', 'KR'),
            Locale('en', 'US'),
          ],
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1)),
              child: child!,
            );
          },
        );
      },
    );
  }
}
