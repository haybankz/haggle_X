import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haggle_x_test/providers/sign_up_provider.dart';
import 'package:haggle_x_test/utils/dimension.dart';
import 'package:haggle_x_test/utils/routes.dart';
import 'package:haggle_x_test/utils/theme.dart';
import 'package:haggle_x_test/widgets/back_button_widget.dart';
import 'package:haggle_x_test/widgets/background_widget.dart';
import 'package:haggle_x_test/widgets/button.dart';
import 'package:haggle_x_test/widgets/country_code_widget.dart';
import 'package:haggle_x_test/widgets/password_input.dart';
import 'package:haggle_x_test/widgets/text_input.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Consumer<SignUpProvider>(
              builder: (_, provider, child) => Form(
                key: provider.signUpFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: BackButtonWidget(onTap: () {
                        Get.back();
                      }),
                    ),
                    YMargin(20),
                    Container(
                      width: screenWidth(context),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: offWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Create a new account',
                            style: textStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: black,
                            ),
                          ),
                          YMargin(30),
                          TextInputWidget(
                            controller: provider.emailCtrl,
                            hintText: "Email Address",
                            keyboardType: TextInputType.emailAddress,
                            borderColor: black,
                            hintColor: black,
                            textColor: black,
                            validator: (value) {
                              if (value.isEmpty)
                                return 'Please enter email address';
                              if (!value.isEmail)
                                return 'Enter a valid email address';
                              return null;
                            },
                          ),
                          YMargin(30),
                          PasswordInputWidget(
                            controller: provider.passwordCtrl,
                            hintText: "Password (Min. 8 characters)",
                            borderColor: black,
                            hintColor: black,
                            textColor: black,
                            validator: (value) {
                              if (value.isEmpty) return 'Enter password';
                              if (value.length < 8)
                                return "Password can not be less than 8 characters";
                              return null;
                            },
                          ),
                          YMargin(30),
                          TextInputWidget(
                            controller: provider.usernameCtrl,
                            hintText: "Create a username",
                            keyboardType: TextInputType.text,
                            borderColor: black,
                            hintColor: black,
                            textColor: black,
                            validator: (value) {
                              if (value.isEmpty) return 'Enter username';
                              return null;
                            },
                          ),
                          YMargin(30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CountryCodeWidget(
                                onSelect: (country) {
                                  provider.setSelectedCountry(country);
                                },
                              ),
                              XMargin(10),
                              Expanded(
                                child: TextInputWidget(
                                  controller: provider.phoneCtrl,
                                  hintText: "Enter your phone number",
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(11),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  borderColor: black,
                                  hintColor: black,
                                  textColor: black,
                                  validator: (value) {
                                    if (value.isEmpty)
                                      return 'Enter phone number';
                                    if (value.length < 10)
                                      return "Enter a valid phone number";
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          YMargin(30),
                          TextInputWidget(
                            controller: provider.referralCodeCtrl,
                            hintText: "Referral code (optional)",
                            keyboardType: TextInputType.text,
                            borderColor: black,
                            hintColor: textColor,
                            textColor: black,
                          ),
                          YMargin(30),
                          Center(
                            child: Text(
                              'By signing, you agree to HaggleX terms and privacy policy',
                              textAlign: TextAlign.center,
                              style: textStyle.copyWith(
                                color: black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          YMargin(30),
                          SecondaryButtonWidget(
                              text: 'SIGN UP',
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                provider.register();
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
