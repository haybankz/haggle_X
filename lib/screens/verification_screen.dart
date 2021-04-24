import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haggle_x_test/utils/dimension.dart';
import 'package:haggle_x_test/utils/routes.dart';
import 'package:haggle_x_test/utils/theme.dart';
import 'package:haggle_x_test/widgets/back_button_widget.dart';
import 'package:haggle_x_test/widgets/background_widget.dart';
import 'package:haggle_x_test/widgets/button.dart';
import 'package:haggle_x_test/widgets/password_input.dart';
import 'package:haggle_x_test/widgets/text_input.dart';

class VerificationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BackButtonWidget(onTap: (){
                        Get.back();
                      }),
                      YMargin(30),
                      Text('Verify your account', style: textStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: offWhite,
                      ),),
                      // YMargin(30),
                    ],
                  ),
                ),
                YMargin(30),
                Container(
                  width: screenWidth(context),
                  padding: EdgeInsets.symmetric(vertical: 40.0,
                      horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: offWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svg/verify.svg', height: 40.0,
                        width: 40.0, fit: BoxFit.cover,),
                      YMargin(30),

                      Text('We just sent a verification code to your email.\nPlease enter the code',
                        textAlign: TextAlign.center,
                        style: textStyle.copyWith(color: black, fontSize: 12,
                        height: 1.5),),
                      YMargin(30),

                      TextInputWidget(controller: null, hintText: "Verification code",
                        keyboardType: TextInputType.number,
                        borderColor: black,
                        hintColor: black,
                        textColor: black,
                      ),
                      YMargin(30),

                      SecondaryButtonWidget(text: 'VERIFY ME',
                          onPressed: (){
                          Get.toNamed(Routes.verificationSuccess);
                      }),
                      YMargin(30),

                      Text('This code expires in 10 minutes',
                        textAlign: TextAlign.center,
                        style: textStyle.copyWith(color: black, fontSize: 12,),),
                      YMargin(30),

                      GestureDetector(
                        onTap: (){},
                        child: Text("Resend Code", style: textStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: black,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.5,
                          decorationStyle: TextDecorationStyle.solid
                        ),),
                      )

                      

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}