
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
    return TextFormField(
      style: TextStyle(color: widget.textColor, fontSize: 16),
      cursorColor: widget.textColor,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      obscureText: _obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0),
        suffix: GestureDetector(
          // padding: EdgeInsets.zero,
          // materialTapTargetSize: MaterialTapTargetSize.padded,
          onTap: _toggleObscure,
          child: Padding(padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            child: _obscureText
              ? Image.asset('assets/icons/hide_pass.png', color: widget.borderColor,
              width: 18, height: 18,)
              : Image.asset('assets/icons/show_pass.png', color: widget.borderColor,
            width: 18, height: 18,),),
          // splashColor: Colors.transparent,
//              color: Colors.white,
//             highlightColor: Colors.transparent,
        ),
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
