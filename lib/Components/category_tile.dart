import 'package:flutter/material.dart';
import 'package:sb/Components/poppintext.dart';

class categoryTile extends StatelessWidget {
  const categoryTile({Key? key,
    required this.gymCategory,
    this.width,
    this.height,
    this.borderRadius,
    this.textFontSize,

  }) : super(key: key);

  final String gymCategory;
  final double ?borderRadius;
  final double ?width;
  final double ?height;
  final double ?textFontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      width: width??50,
      height: height??15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:  BorderRadius.all(Radius.circular(borderRadius??16)),
      ),
      child: Center(child: PoppinText(text: gymCategory, fontWeight:FontWeight.bold, fontsize: textFontSize??10,))
    );
  }
}
