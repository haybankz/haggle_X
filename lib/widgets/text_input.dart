
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haggle_x_test/utils/theme.dart';



class TextInputWidget extends StatefulWidget {
//  Key key;
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String Function(String) validator;

  final List<TextInputFormatter> inputFormatters;
  final Color borderColor;
  final Color textColor;
  final Color hintColor;

  TextInputWidget({ @required this.controller, @required this.hintText,
     this.keyboardType = TextInputType.text, this.validator,
    this.inputFormatters = const [],
    this.borderColor = offWhite,
    this.textColor = offWhite,
    this.hintColor = offWhite

  });

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInputWidget> {




  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: widget.textColor, fontSize: 16),
      cursorColor: widget.textColor,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 4),
        isDense: true,
        labelText: widget.hintText,
        labelStyle: TextStyle(color: widget.hintColor,),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor, width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: accent, width: 1),
        ),

        // hintText: widget.hintText,
        // hintStyle: TextStyle(color: textColor),
      ),


    );
  }


}
