import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:haggle_x_test/utils/dimension.dart';
import 'package:haggle_x_test/utils/routes.dart';
import 'package:haggle_x_test/utils/theme.dart';
import 'package:haggle_x_test/widgets/background_widget.dart';
import 'package:haggle_x_test/widgets/button.dart';

class VerificationSuccessScreen extends StatelessWidget {

  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  SvgPicture.asset('assets/svg/verify_done.svg', height: 40.0,
                    width: 40.0, fit: BoxFit.cover,),
                  YMargin(20),

                  Text('Setup Complete',
                    textAlign: TextAlign.center,
                    style: textStyle.copyWith(fontSize: 18,
                     fontWeight: FontWeight.bold),),
                  YMargin(20),
                  Text('Thank you for setting up your HaggleX account',
                    textAlign: TextAlign.center,
                    style: textStyle.copyWith(fontSize: 12,
                        height: 1.5),),
                  YMargin(30),

                ],
              ),
              YMargin(30),
              ButtonWidget(text: 'START EXPLORING', onPressed: (){
                Get.offAndToNamed(Routes.dashboard);
              }),
            ],
          ),
        ),
      ),
    );
  }
}