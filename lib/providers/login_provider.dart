import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_x_test/api_response.dart';
import 'package:haggle_x_test/data/models/login_response_dto.dart';
import 'package:haggle_x_test/data/repository/remote_repository.dart';
import 'package:haggle_x_test/locator.dart';
import 'package:haggle_x_test/utils/dialog_utils.dart';
import 'package:haggle_x_test/utils/routes.dart';

class LoginProvider extends ChangeNotifier {
  RemoteRepository _repository = locator<RemoteRepository>();

  TextEditingController emailCtrl;
  TextEditingController passwordCtrl;
  GlobalKey<FormState> loginFormKey;

  initLogin() {
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    loginFormKey = GlobalKey<FormState>();
  }

  void login() async {
    loginFormKey.currentState.save();
    if (loginFormKey.currentState.validate()) {
      showLoader();

      ApiResponse<LoginResponseDto> response = await _repository.login(
          emailCtrl.text.trim(), passwordCtrl.text.trim());

      closeLoader();

      if (response.status == Status.ERROR) {
        //TODO show error message
        showMessage(response.message);
        passwordCtrl.clear();
      } else {
        Get.offAndToNamed(Routes.dashboard);
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }
}
