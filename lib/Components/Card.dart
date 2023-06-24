import 'package:flutter/material.dart';


class CardWidget extends StatelessWidget {
  const CardWidget({Key? key,
  required this.height,
    required this.width,
    this.child,
    this.padding,
    this.color,
    this.borderRadius,
  }) : super(key: key);

  final double height;
  final double width;
  final Widget? child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width:  width,
      alignment: Alignment.center,
      height: height,
      decoration:  BoxDecoration(
        color:  color ??Color(0xff2C2C2E),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius??6)),
      ),
      child: child,
    );
  }
}
