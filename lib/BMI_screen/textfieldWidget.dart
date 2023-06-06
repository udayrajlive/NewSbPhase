import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {  required this.hintText,
        required this.suffixText,
        required this.textController,
        required this.textInputType,
      });

  final  TextInputType textInputType;
  final String hintText;
  final String suffixText;
  final TextEditingController textController;

  @override
  _TextFieldWidgetState createState() =>
      _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return  TextField(
      maxLength: 5,
       style: TextStyle(
         fontFamily: "Poppins",
         color: Colors.white,
       ),
      keyboardType: widget.textInputType,
      decoration:  InputDecoration(

      hintText: widget.hintText,
      hintStyle: TextStyle(
        fontFamily: "Poppins",
      fontSize: 16,
      color: Color(0xff505050),
    ),
          suffixText:widget.suffixText,
          suffixStyle: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20,
            color: Color(0xff505050),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Color(0xff2C2C2E)),
      onChanged:(value){
        print(value);
      } ,

    );
  }
}


