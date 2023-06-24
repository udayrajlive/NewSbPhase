import 'package:flutter/material.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:sb/Booking%20page/Booking_details.dart';
import 'package:sb/Components/Card.dart';
import 'package:sb/Components/category_tile.dart';
import 'package:sb/Components/poppintext.dart';

class BookingWidget extends StatelessWidget {
  BookingWidget({
    Key? key,
    required this.gymName,
    required this.gymCategory,
    this.bookingStatus,
    required this.paymentStatus,
    required this.paymentTime,
    required this.offerPrice,
    required this.actualPrice,
  }) : super(key: key);

  final String gymName;
  final String gymCategory;
  late String? bookingStatus;
  final String paymentStatus;
  final DateTime paymentTime;
  final String actualPrice;
  final String offerPrice;

  Color _getTextColor() {
    DateTime currentTime = DateTime.now();
    Color PaymentTextColor;
    if (paymentStatus == 'successfull') {
      PaymentTextColor = Colors.green;
      if (currentTime.isBefore(paymentTime)) {
        bookingStatus = 'active';
        return PaymentTextColor;
      } else {
        bookingStatus = 'completed';
        return PaymentTextColor;
      }
    } else if (paymentStatus == 'failed' || paymentStatus =='cancelled') {
      PaymentTextColor = Colors.red;
      bookingStatus = 'cancelled';
      return PaymentTextColor;
    } else if (paymentStatus == 'pending') {
      bookingStatus = 'pending';
      PaymentTextColor = Colors.yellow;
      return PaymentTextColor;
    }
    else{
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      height: 95,
      width: MediaQuery.of(context).size.width * 0.95,
      child: Row(
        children: [
          Container(
            width: 94,
            height: 94,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: ClipRRect(
              child: Image.asset(
                "assets/gym_logo.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),

          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinText(
                    text: "$gymName",
                    fontsize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  Row(children: [
                    categoryTile(gymCategory: gymCategory),
                    categoryTile(gymCategory: gymCategory),
                  ]),
                  Row(children: [
                    PoppinTextlineTrought(
                      text: "₹$actualPrice",
                      fontsize: 15,
                      color: Colors.grey,
                    ),

                    ///default price without coupon
                    // PoppinTextlineTrought(text: "49", fontsize: 7.5,color: Colors.grey,),
                    SizedBox(
                      width: 4,
                    ),

                    ///offer price with coupon
                    PoppinText(
                      text: "₹$offerPrice",
                      fontsize: 20,
                      color: Color(0xffB3FA3B),
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    PoppinText(
                      text: "plus GST/",
                      color: Colors.white,
                      fontsize: 9,
                    ),
                    PoppinText(
                      text: "session",
                      fontsize: 9,
                      color: Color(0xffB3FA3B),
                    )
                    // PoppinText(text: "19", fontsize: 9,color: Color(0xffB3FA3B),),
                  ]),
                ],
              )),

          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PoppinText(
                    text: "$paymentStatus" ?? "null",
                    color: _getTextColor(),
                    fontsize: 12,
                  ),
                  PoppinText(
                    text: "$bookingStatus" ?? "null",
                    color: Colors.white,
                    fontsize: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookingDetails(gymName: gymName, gymCategory: gymCategory,
                            gymAddress: ''' 234 kanpur kalyanpur uttar pradesh india''', bookingStatus: bookingStatus,
                            paymentStatus: paymentStatus, paymentTime: paymentTime,
                            offerPrice: offerPrice, actualPrice: actualPrice,
                            startDate: "12 July 2023", endDate: "12 July 2023", bookingTime: "6:30 Pm",
                            numberOfPerson: "2", discount: "No",
                            days: "1", paymentMethod: "Razorpay") )

                      );
                    },
                    child: PoppinTextUnderLined(
                      text: 'More Details',
                      fontsize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ],
              ))

        ],
      ),
    );

  }
}
