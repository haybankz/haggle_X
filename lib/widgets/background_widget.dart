import 'package:flutter/material.dart';
import 'package:haggle_x_test/utils/dimension.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  BackgroundWidget({@required this.child}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill)),
      child: Container(
          height: screenHeight(context),
          width: screenWidth(context),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.fill)),
          child: child),
    );
  }
}
