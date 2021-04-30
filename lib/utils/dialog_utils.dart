import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:haggle_x_test/utils/theme.dart';

void showLoader() {
  if (!Get.isDialogOpen) {
    Get.dialog(
        WillPopScope(
          onWillPop: () async {
            return Future.value(false);
          },
          child: Center(
            child: Container(
              width: 70,
              height: 70,
              child: SpinKitSquareCircle(
                color: purple,
                size: 40,
              ),
            ),
          ),
        ),
        barrierDismissible: false,
    barrierColor: offWhite.withOpacity(0.2));
  }
}

void showMessage(String message, {bool isError = true}) {
  Get.snackbar(isError ? 'Error' : 'Success', message,
      borderRadius: 10,
      padding: EdgeInsets.all(10),
      barBlur: 100.0,
      backgroundColor: isError ? Colors.redAccent : Colors.green,
      isDismissible: true,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      shouldIconPulse: true,
      colorText: lightPrimary,
      icon: Icon(
        Icons.info,
        color: lightPrimary,
      ));
}

void closeLoader() {
  if (Get.isDialogOpen) {
    Get.back();
  }
}
