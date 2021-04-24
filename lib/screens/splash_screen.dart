import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_x_test/utils/dimension.dart';
import 'package:haggle_x_test/utils/routes.dart';
import 'package:haggle_x_test/utils/theme.dart';
import 'package:haggle_x_test/widgets/background_widget.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashScreen>{

  @override
  void initState() {

    //dispose splash screen and navigate to login screen after 2seconds
    Timer(Duration(seconds: 2), (){
      Get.offAndToNamed(Routes.login);
    });

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/app_logo.png', fit: BoxFit.contain,
            width: screenWidth(context, percent: 25),
              height: screenWidth(context, percent: 25),),
            YMargin(20),
            Text("HaggleX", style: textStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold),)

          ],
        ),
      ),
    );
  }

}