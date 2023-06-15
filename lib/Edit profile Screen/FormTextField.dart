import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({
    Key? key,
    this.labelText,
    this.controller,
    required this.validator,
    required this.hint,
    this.textAlign,
    this.textInputType,
    this.maxLength,
    this.enabled,
    this.maxLines,
    this.suffixText,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final String hint;
  final TextAlign? textAlign;
  final TextInputType? textInputType;
  final int? maxLength;
  final bool? enabled;
  final int? maxLines;
  final String? labelText;
  final String? suffixText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xff2C2C2E),
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      // alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5),
        child: TextFormField(
          maxLines: maxLines,
          enabled: enabled,
          maxLength: maxLength,
          buildCounter: (
            context, {
            currentLength = 0,
            isFocused = false,
            maxLength = 10,
          }) {
            return const SizedBox.shrink();
          },
          validator: validator,
          controller: controller,
          keyboardType: textInputType,
          decoration: InputDecoration(
            suffixText: suffixText,
            suffixStyle: TextStyle(
                fontFamily: "Poppins", color: Colors.white, fontSize: 16),
            labelText: labelText,
            labelStyle:
                TextStyle(

                    fontFamily: "Poppins", color: Color(0xff505050)
                )
            ,
            // border: UnderlineInputBorder(
            //     borderSide: BorderSide.none,
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(6),
            //     )),
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            hintStyle: TextStyle(

              fontFamily: "Poppins",
              letterSpacing: -0.1,
              color: Color(0xff505050),
            ),
            hintText: hint,
            fillColor: Color(0xff2C2C2E),
            filled: true,
          ),
          textAlign: textAlign ?? TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "poppins",
            letterSpacing: 0.6,
          ),
          textAlignVertical: TextAlignVertical.center,
          cursorWidth: 2.0,
        ),
      ),
    );
  }
}
