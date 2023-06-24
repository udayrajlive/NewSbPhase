import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({Key? key,
    required  this.width,
    required this.heigth,
    required this.text,
    required this.ontap,
    this.fontSize,




  }) : super(key: key);

  final double width ;
  final double heigth;
  final String text;
  final double ?fontSize;
  final VoidCallback  ontap;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 160,
      height: heigth?? 35,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:  Color(0xffB3FA3F).withOpacity(0.25),
            blurRadius: 10,
          )
        ],
          color: Color(0xffB3FA3F),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize??20,
            fontFamily:"Poppins",
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
