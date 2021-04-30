import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_x_test/providers/login_provider.dart';
import 'package:haggle_x_test/providers/sign_up_provider.dart';
import 'package:haggle_x_test/utils/dimension.dart';
import 'package:haggle_x_test/utils/routes.dart';
import 'package:haggle_x_test/utils/theme.dart';
import 'package:haggle_x_test/widgets/background_widget.dart';
import 'package:haggle_x_test/widgets/button.dart';
import 'package:haggle_x_test/widgets/password_input.dart';
import 'package:haggle_x_test/widgets/text_input.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
            child: SingleChildScrollView(
              child: Consumer<LoginProvider>(
                builder: (_, provider, child) => Form(
                  key: provider.loginFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome!',
                            style: textStyle.copyWith(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      YMargin(50),
                      TextInputWidget(
                        controller: provider.emailCtrl,
                        hintText: 'Email Address',
                        keyboardType: TextInputType.emailAddress,
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
                        hintText: 'Password (Min. 8 characters)',
                        validator: (value) {
                          if (value.isEmpty) return 'Enter password';
                          if(value.length < 8) return "Password can not be less than 8 characters";
                          return null;
                        },
                      ),
                      YMargin(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: textStyle.copyWith(color: offWhite),
                          ),
                        ],
                      ),
                      YMargin(30),
                      ButtonWidget(text: 'LOG IN', onPressed: () {
                        FocusScope.of(context).unfocus();
                        provider.login();
                      }),
                      YMargin(30),
                      Consumer<SignUpProvider>(
                        builder:(_, provider, child) => RichText(
                          text: TextSpan(
                              text: 'New User? ',
                              style: textStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Create a new account',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        FocusScope.of(context).unfocus();
                                      provider.initRegister();
                                        Get.toNamed(Routes.signUp);
                                      })
                              ]),
                        ),
                      ),
                      YMargin(30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
