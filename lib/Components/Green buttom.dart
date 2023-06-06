import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({Key? key,
    required  this.width,
    required this.heigth,
    required this.text,




  }) : super(key: key);

  final double width ;
  final double heigth;
  final String text;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 160,
      height: heigth?? 35,
      decoration: BoxDecoration(
          color: Color(0xffB3FA3F),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontFamily:"Poppins",
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
