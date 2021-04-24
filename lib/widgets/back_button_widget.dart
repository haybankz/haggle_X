import 'package:flutter/material.dart';
import 'package:haggle_x_test/utils/theme.dart';

class BackButtonWidget extends StatelessWidget {

  final Function onTap;

  BackButtonWidget({@required this.onTap}) : assert( onTap != null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Color(0xff6A4BBC).withOpacity(0.3),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(Icons.arrow_back_ios_rounded, size: 20, color: offWhite,),
      ),
    );
  }
}