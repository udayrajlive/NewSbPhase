import 'package:flutter/material.dart';
import 'package:sb/Booking%20page/booking_widget.dart';
import 'package:sb/Components/poppintext.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key,
    required this.totalBookings,
  }) : super(key: key);

  final String totalBookings;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(

        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.only(left:30, right: 30,),
              child: Row(/// total booking
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PoppinText(text: "Total Bookings",
                  fontWeight: FontWeight.bold,
                    fontsize: 20  ,
                    color: Colors.white,
                  ),
                  PoppinText(text:widget.totalBookings, fontWeight:  FontWeight.bold,color: Colors.white, fontsize: 17,),

                ],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            BookingWidget(GymName: "Gold's gym", GymCategory: "Luxury", PaymentStatus: "success", PaymentTime: DateTime(2023, 6, 13, 9, 0, 0), actualPrice: '49', offerPrice: '19', )



          ],
        ),
      )

    );
  }
}
