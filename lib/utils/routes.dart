import 'package:get/get.dart';
import 'package:haggle_x_test/screens/login_screen.dart';
import 'package:haggle_x_test/screens/sign_up_screen.dart';
import 'package:haggle_x_test/screens/splash_screen.dart';
import 'package:haggle_x_test/screens/verification_screen.dart';
import 'package:haggle_x_test/screens/verification_success_screen.dart';

class Routes {
  static const String splash = "/splash";
  static const String login = "/login";
  static const String signUp = "/sign-up";
  static const String verification = "/verification";
  static const String verificationSuccess = "/verification-success";
}

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.splash,
      page: () => SplashScreen(),

    ),
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),

    ),
    GetPage(
      name: Routes.signUp,
      page: () => SignUpScreen(),
      transition: Transition.size,
      transitionDuration: Duration(milliseconds: 300)
    ),
    GetPage(
        name: Routes.verification,
        page: () => VerificationScreen(),
        transition: Transition.size,
        transitionDuration: Duration(milliseconds: 300)
    ),
    GetPage(
        name: Routes.verificationSuccess,
        page: () => VerificationSuccessScreen(),
        transition: Transition.size,
        transitionDuration: Duration(milliseconds: 300)
    ),
  ];
}