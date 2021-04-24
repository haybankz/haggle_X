
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haggle_x_test/utils/theme.dart';



class PasswordInputWidget extends StatefulWidget {
//  Key key;
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String Function(String) validator;
  final List<TextInputFormatter> inputFormatters;
  final Color borderColor;
  final Color textColor;
  final Color hintColor;

  PasswordInputWidget({@required this.controller, @required this.hintText,
     this.keyboardType = TextInputType.text, this.validator,
    this.inputFormatters = const [],
    this.borderColor = offWhite,
    this.textColor = offWhite,
    this.hintColor = offWhite,

  });

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<PasswordInputWidget> {

  bool _obscureText = true;

  //toggle bool state of password clear text visibility
  _toggleObscure(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.passthrough,
      children: [
        TextFormField(
          style: TextStyle(color: widget.textColor, fontSize: 16),
          cursorColor: widget.textColor,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
          obscureText: _obscureText,
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.zero,
            isDense: false,
            labelText: widget.hintText,
            labelStyle: TextStyle(color: widget.hintColor,),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor, width: 2),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: accent, width: 2),
            ),

            // hintText: widget.hintText,
            // hintStyle: TextStyle(color: textColor),
          ),


        ),
        Positioned(
          right: -20,
          top: -8,
          child: FlatButton(
            onPressed: _toggleObscure,
            child: _obscureText
                ? ImageIcon(
              AssetImage('assets/icons/hide_pass.png'),
              color: offWhite,
              size: 18,
            )
                : ImageIcon(
                AssetImage('assets/icons/show_pass.png'),
                color: offWhite,
                size: 16
            ),
            splashColor: Colors.transparent,
//              color: Colors.white,
            highlightColor: Colors.transparent,
          ),
        )
      ],
    );
  }


}
