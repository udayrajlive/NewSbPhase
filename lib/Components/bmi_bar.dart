import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'dart:math';

import 'package:sb/Components/poppintext.dart';

class BmiBar extends StatelessWidget {
  const BmiBar({
  required this.bmi,
  Key? key}) : super(key: key);

  final num bmi;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 180,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 55,
            child: CustomPaint(
              size: Size.square(200), // Set the size of the CustomPaint widget
              painter: RainbowBarPainter(),
            ),
          ),
          Positioned(
            top: 25,
            left: 48,
            child: SizedBox(width: 215,
                child: Radialgauge(BMI: bmi)),
          ),

          Positioned(
            top: 75,
            left: 130,

            child: Container(
              width: 50,
              alignment: Alignment.center,
              child: PoppinText(
                text:  "${bmi.toString()}",
                fontsize: 20,
                color: Color(0xffB3FA3F),
              ),
            ),
          ),

          Positioned(
            left: 80,
            top: 100,
            child: Container(
              width: 150,
              alignment: Alignment.center,
              child: PoppinText(
                text:  _getBmiStatus(Bmi: bmi),
                fontsize: 20,
                color: Color(0xff7FF133),
              ),
            ),
          )


        ],
      ),
    );
  }
}

String _getBmiStatus({required num Bmi}) {
  if(Bmi<18){
    return "Underweight";

  }
  else if(Bmi>=18 && Bmi<=25){
    return "Normal";
  }
  else return " Overweight";
}

class RainbowBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final startAngle = -pi;
    final endAngle = pi;

    final rect = Rect.fromCircle(
      center: Offset(radius, radius),
      radius: radius,
    );
    final gradient = SweepGradient(
      colors: [
        // Colors.white,
        Color(0xffFF5455),
        Color(0xffFEB92F),
        Color(0xffFFFF30),
        Color(0xffB9FF2F),
        Color(0xff75FD31),
        Color(0xffFE7C3C),
        Color(0xffFF5455),
      ],
      stops: [
        0.0,
        0.3,
        0.4,
        0.60,
        0.80,
        0.90,
        1.00,
      ],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, endAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Radialgauge extends StatefulWidget {
  const Radialgauge({required this.BMI, Key? key}) : super(key: key);

  final num BMI;

  @override
  State<Radialgauge> createState() => _RadialgaugeState();
}

class _RadialgaugeState extends State<Radialgauge> {
  @override
  Widget build(BuildContext context) {
    // Create animated radial gauge.
    // All arguments changes will be automatically animated.
    return AnimatedRadialGauge(
      // initialValue: 40,
      /// The animation duration.
      duration: const Duration(milliseconds: 500),

      /// Gauge value.
      value: widget.BMI.toDouble(),

      /// Provide the [min] and [max] value for the [value] argument.

      /// Optionally, you can configure your gauge, providing additional
      /// styles and transformers.
      axis: GaugeAxis(
        /// Render the gauge as a 260-degree arc.
        degrees: 180,
        min: 0,
        max: 35,

        /// Display the green value progress.

        transformer:
            const GaugeAxisTransformer.progress(color: Colors.transparent),

        /// Set the background color and axis thickness.
        style: const GaugeAxisStyle(
          thickness: 18,
          background: Colors.transparent,
        ),

        /// Define the pointer that will indicate the progress.
        pointer: RoundedTrianglePointer(
          size: 20,
          backgroundColor: Colors.black,
          borderRadius: 2,
          border: const GaugePointerBorder(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),

      /// You can also, define the value label style.
      // style: const GaugeStyle(
      //   labelStyle: TextStyle(
      //     color: Colors.black,
      //     fontSize: 46,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
    );
  }
}