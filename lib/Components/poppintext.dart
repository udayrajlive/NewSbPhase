import 'package:flutter/material.dart';

class PoppinText extends StatelessWidget {
  const PoppinText({Key? key,
   required  this.text,
    this.fontsize,
    this.fontWeight,
    this.color,


  }) : super(key: key);

   final String text;
   final double? fontsize;
   final FontWeight? fontWeight;
   final Color?  color;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(
        overflow: TextOverflow.ellipsis,
        fontFamily: "Poppins",
        fontSize: fontsize,
        fontWeight: fontWeight,
        color:  color,
      ),
    );
  }
}

class PoppinTextlineTrought extends StatelessWidget {
  const PoppinTextlineTrought({Key? key,
    required  this.text,
    this.fontsize,
    this.fontWeight,
    this.color,

  }) : super(key: key);


  final String text;
  final double? fontsize;
  final FontWeight? fontWeight;
  final Color?  color;

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style:  TextStyle(

        decoration:  TextDecoration.lineThrough,
        decorationThickness: 2,
        decorationStyle: TextDecorationStyle.solid,
        decorationColor: Colors.grey,
        fontFamily: "Poppins",
        fontSize: fontsize,
        fontWeight: fontWeight,
        color:  color,
    ),

    );
    }
}


class PoppinTextUnderLined extends StatelessWidget {
  const PoppinTextUnderLined({Key? key,
    required  this.text,
    this.fontsize,
    this.fontWeight,
    this.color,


  }) : super(key: key);

  final String text;
  final double? fontsize;
  final FontWeight? fontWeight;
  final Color?  color;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(
        overflow: TextOverflow.ellipsis,
        fontFamily: "Poppins",
        fontSize: fontsize,
        fontWeight: fontWeight,
        color:  color,
        decoration: TextDecoration.underline,
        decorationThickness: 2,
        decorationStyle: TextDecorationStyle.solid,
        decorationColor: Colors.white,
      ),
    );
  }
}
