import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sb/Components/poppintext.dart';



class ProgressIndicatorWidget extends StatefulWidget {
   ProgressIndicatorWidget({
  required this.targetValue,
    required this.progressValue,
  Key? key}) : super(key: key);

  late  num progressValue ; // Initial progress value
  final num targetValue ;

  @override
  _ProgressIndicatorWidgetState createState() => _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget> {
  // double progressValue = 3500; // Initial progress value
  // double targetValue = 3500; // Target value

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    widget.progressValue;

    super.setState(fn);
  }



  void updateProgress(num newValue) {
    setState(() {
      widget.progressValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progressPercentage = (widget.progressValue / widget.targetValue) * 100;

    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        children: [
          // Visibility(
          //     visible: progressPercentage>=100? true: false,
          //     child: Positioned(
          //       child: Lottie.asset('assets/confetti.json',repeat: false),
          //     )
          //
          // ),
          //
          Positioned(
            left: 30,
            top :25,

            child: Container(
              width: 140,
              height: 140,
              child: CircularProgressIndicator(
                strokeCap: StrokeCap.round,
                backgroundColor: Color(0xff93969D),
                value: progressPercentage / 100,
                strokeWidth: 16,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xffB3FA3F)), // Set color to green
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: 70,
            child: Column(
              children: [
                PoppinText(
                  text: widget.progressValue.toString(),
                  fontsize: 24,
                  color: Color(0xffB3FA3F),
                ),

                PoppinText(
                  text: widget.targetValue.toString(),
                  fontsize: 20,
                  color: Color(0xff464651),
                ),
              ],
            ),
          ),

           Positioned(
             top:180,
             child: Row(
               children:[
                 Container(
                   width: 10,
                   height: 10,
                   decoration: BoxDecoration(
                     borderRadius:  BorderRadius.all(Radius.circular(12)),
                     color: progressPercentage<100 ? Colors.red:Colors.grey
                   ),
                 ),
                 SizedBox(
                   width: 6,
                 ),
                 PoppinText(text: "Remaining",fontsize: 12,color: Colors.white,),
                 SizedBox(
                   width: 25,

                 ),
                 Container(
                   width: 10,
                   height: 10,
                   decoration: BoxDecoration(
                       borderRadius:  BorderRadius.all(Radius.circular(12)),
                       color: progressPercentage>=100? Colors.green:Colors.grey
                   ),
                 ),
                 SizedBox(
                   width: 6,
                 ),
                 PoppinText(text: "Completed",
                 fontsize: 12,
                   color: Colors.white,
                 )

               ]
             ),
           )

        ],
      ),
    );
  }
}