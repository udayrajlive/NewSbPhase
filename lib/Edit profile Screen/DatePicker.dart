import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 
class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({Key? key}) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime dateTime =  DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  buildDatePicker(),
    );



  }
  Widget buildDatePicker()=> SizedBox(
    height: 50,
    width: 300,
    child: CupertinoDatePicker(
      minimumYear: 1960,
      maximumYear: DateTime.now().year,
      initialDateTime: dateTime,
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (dateTime)=>
          setState(() => this.dateTime = dateTime),

    ),
  );
}

