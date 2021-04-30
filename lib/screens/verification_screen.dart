import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haggle_x_test/providers/sign_up_provider.dart';
import 'package:haggle_x_test/utils/dimension.dart';
import 'package:haggle_x_test/utils/routes.dart';
import 'package:haggle_x_test/utils/theme.dart';
import 'package:haggle_x_test/widgets/back_button_widget.dart';
import 'package:haggle_x_test/widgets/background_widget.dart';
import 'package:haggle_x_test/widgets/button.dart';
import 'package:haggle_x_test/widgets/password_input.dart';
import 'package:haggle_x_test/widgets/text_input.dart';
import 'package:provider/provider.dart';

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
                    child: Consumer<SignUpProvider>(
                      builder: (_, provider, child) => Form(
                        key: provider.verifyUserFormKey,
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

                            TextInputWidget(controller: provider.codeCtrl, hintText: "Verification code",
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(6),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              borderColor: black,
                              hintColor: black,
                              textColor: black,
                              validator: (value){
                              if(value.isEmpty) return 'Enter verification code';
                              if(value.length < 6) return 'Enter a valid 6-digits code';
                              return null;
                              },
                            ),
                            YMargin(30),

                            SecondaryButtonWidget(text: 'VERIFY ME',
                                onPressed: (){
                                  FocusScope.of(context).unfocus();
                                provider.verifyUser();
                            }),
                            YMargin(30),

                            Text('This code expires in 10 minutes',
                              textAlign: TextAlign.center,
                              style: textStyle.copyWith(color: black, fontSize: 12,),),
                            YMargin(30),

                            GestureDetector(
                              onTap: (){
                                FocusScope.of(context).unfocus();
                                provider.resendToken();
                              },
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
                      ),
                    ),
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}