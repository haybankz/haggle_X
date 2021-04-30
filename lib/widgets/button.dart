import 'package:flutter/material.dart';
import 'package:haggle_x_test/utils/dimension.dart';
import 'package:haggle_x_test/utils/theme.dart';
import 'package:sizer/sizer.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool enabled;
  final double width;
  final bool loading;

  ButtonWidget(
      {@required this.text,
      @required this.onPressed,
      this.enabled = true,
      this.width = 0.0,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == 0.0 ? screenWidth(context) : width,
      height: 50,
      child: RaisedButton(
        elevation: 0,
        onPressed: enabled && !loading ? onPressed : () {},
        splashColor: accent.withOpacity(0.2),
        color: yellow,
        child: !loading
            ? Text(
                text,
                style: TextStyle(
                    color: brown, fontSize: 15, fontWeight: FontWeight.bold),
              )
            : Container(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(accent),
                  strokeWidth: 1.5,
                )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.only(left: 0, right: 0, top: 14, bottom: 14),
      ),
    );
  }
}

class SecondaryButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool enabled;
  final double width;
  final bool loading;

  SecondaryButtonWidget(
      {@required this.text,
      @required this.onPressed,
      this.enabled = true,
      this.width = 0.0,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width == 0.0 ? screenWidth(context) : width,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xff432B7B),
              Color(0xff6A4BBC),
            ],
          ),
        ),
        child: Material(
            color: Colors.transparent,
            child: Center(
              child: !loading
                  ? Text(
                      text,
                      style: TextStyle(
                          color: offWhite,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  : Container(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(accent),
                        strokeWidth: 1,
                      )),
            )),
      ),
    );
  }
}
