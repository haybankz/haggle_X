import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_x_test/utils/dimension.dart';
import 'package:haggle_x_test/utils/routes.dart';
import 'package:haggle_x_test/utils/theme.dart';
import 'package:haggle_x_test/widgets/background_widget.dart';
import 'package:haggle_x_test/widgets/button.dart';
import 'package:haggle_x_test/widgets/password_input.dart';
import 'package:haggle_x_test/widgets/text_input.dart';

class LoginScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BackgroundWidget(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Welcome!', style: textStyle.copyWith(fontSize: 40, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  YMargin(50),

                  TextInputWidget(controller: TextEditingController(), hintText: 'Email Address',
                    keyboardType: TextInputType.emailAddress,),
                  YMargin(30),

                  PasswordInputWidget(controller: TextEditingController(), hintText: 'Password (Min. 8 characters)'),
                  YMargin(30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password?', style: textStyle.copyWith(color: offWhite),),
                    ],
                  ),
                  YMargin(30),

                  ButtonWidget(text: 'LOG IN', onPressed: (){}),
                  YMargin(30),

                  RichText(text: TextSpan(text:'New User? ',
                      style: textStyle,
                      children: <TextSpan>[
                        TextSpan(text: 'Create a new account',
                            recognizer: TapGestureRecognizer()..onTap = () {
                          Get.toNamed(Routes.signUp);
                            }
                        )
                      ]),),
                  YMargin(30),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}