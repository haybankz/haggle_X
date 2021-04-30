import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_x_test/api_response.dart';
import 'package:haggle_x_test/data/models/active_countries_response_dto.dart';
import 'package:haggle_x_test/data/models/register_response_dto.dart';
import 'package:haggle_x_test/data/models/request/register_request_dto.dart';
import 'package:haggle_x_test/data/models/verify_user_response_dto.dart';
import 'package:haggle_x_test/data/repository/remote_repository.dart';
import 'package:haggle_x_test/data/repository/local_repository.dart';
import 'package:haggle_x_test/locator.dart';
import 'package:haggle_x_test/utils/dialog_utils.dart';
import 'package:haggle_x_test/utils/routes.dart';

class SignUpProvider extends ChangeNotifier {
  RemoteRepository _repository = locator<RemoteRepository>();
  LocalRepository _localRepository = locator<LocalRepository>();

  Country selectedCountry = Country(
      name: "Nigeria",
      alpha2Code: "NG",
      alpha3Code: "NGA",
      callingCode: "234",
      flag: "https://restcountries.eu/data/nga.svg",
      currencyCode: "NGN",
      currencyDetails:
          CurrencyDetails(code: "NGN", name: "Nigerian naira", symbol: "₦"));

  //for register
  TextEditingController emailCtrl;
  TextEditingController passwordCtrl;
  TextEditingController usernameCtrl;
  TextEditingController phoneCtrl;
  TextEditingController referralCodeCtrl;
  GlobalKey<FormState> signUpFormKey;

  //for verifyUser
  TextEditingController codeCtrl;
  GlobalKey<FormState> verifyUserFormKey;

  void initRegister() {
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    usernameCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
    referralCodeCtrl = TextEditingController();
    signUpFormKey = GlobalKey<FormState>();
  }

  void setSelectedCountry(Country country) {
    selectedCountry = country;
    print(country.toJson());
  }

  Future<void> register() async {
    signUpFormKey.currentState.save();
    if (signUpFormKey.currentState.validate()) {
      showLoader();

      RegisterRequestDto request = RegisterRequestDto(
          email: emailCtrl.text.trim(),
          password: passwordCtrl.text.trim(),
          username: usernameCtrl.text.trim(),
          phonenumber: phoneCtrl.text.trim(),
          referralCode: referralCodeCtrl.text.trim(),
          phoneNumber: phoneCtrl.text.trim(),
          flag: selectedCountry.flag,
          callingCode: selectedCountry.callingCode,
          country: selectedCountry.name,
          currency: selectedCountry.currencyDetails.code);

      ApiResponse<RegisterResponseDto> response =
          await _repository.register(request);
      closeLoader();
      if (response.status == Status.ERROR) {
        //TODO show error message
        showMessage(response.message);
      } else {
        _localRepository.saveData(
            'email', response.data?.register?.user?.email ?? '');

        initVerifyUser();
        Get.offAndToNamed(Routes.verification);
      }
    }
  }

  initVerifyUser() {
    codeCtrl = TextEditingController();
    verifyUserFormKey = GlobalKey<FormState>();
  }

  Future<void> verifyUser() async {
    verifyUserFormKey.currentState.save();
    if (verifyUserFormKey.currentState.validate()) {
      showLoader();

      ApiResponse<VerifyUserResponseDto> response =
          await _repository.verifyUser(int.parse(codeCtrl.text.trim()));
      print(response.message);

      closeLoader();

      if (response.status == Status.ERROR) {
        //TODO show message
        showMessage(response.message);
      } else {
        Get.offAndToNamed(Routes.verificationSuccess);
      }
    }
  }

  Future<void> resendToken() async {
    showLoader();

    String email = await _localRepository.getData("email");
    ApiResponse<bool> response =
        await _repository.resendVerificationCode(email);
    closeLoader();

    if (response.status == Status.ERROR) {
      //TODO showError message
      showMessage(response.message);
    }
    {
      //TODO show success message
      showMessage(response.message, isError: false);
    }
  }
}
