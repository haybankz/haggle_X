
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_x_test/utils/routes.dart';
import 'package:haggle_x_test/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HaggleX Test',
      defaultTransition: Transition.zoom,
      transitionDuration: Duration(milliseconds: 400),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      theme: appTheme,
      initialRoute: Routes.splash,
    );
  }
}



