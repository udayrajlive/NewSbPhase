import 'package:flutter/material.dart';
import 'package:sb/Booking%20page/booking_widget.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: BookingWidget(GymName: '', GymCategory: '', BookingStatus: '',)),
    );
  }
}
