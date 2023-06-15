
import 'package:flutter/material.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:sb/Components/Card.dart';
import 'package:sb/Components/category_tile.dart';
import 'package:sb/Components/poppintext.dart';

class BookingWidget extends StatelessWidget {
   BookingWidget({Key? key,
    required this.GymName,
    required  this.GymCategory,
              this.BookingStatus,
     required this.PaymentStatus,
     required this.PaymentTime,

    required this.offerPrice,
    required this.actualPrice,


  }) : super(key: key);

  final String  GymName;
  final String GymCategory;
  late  String? BookingStatus;
  final String PaymentStatus;
  final DateTime PaymentTime;
   final String actualPrice ;
 final  String offerPrice ;

   Color _getTextColor() {
     DateTime currentTime = DateTime.now();
     Color PaymentTextColor;
     if (PaymentStatus== 'success') {
       PaymentTextColor = Colors.green;
       if(currentTime.isBefore(PaymentTime))
         {
           BookingStatus='active';
           return PaymentTextColor;
         }
       else {
         BookingStatus = 'Completed';
         return PaymentTextColor;
       }

     } else if (PaymentStatus == 'failed') {
       PaymentTextColor = Colors.red;
       BookingStatus = 'Cancelled';
       return PaymentTextColor;

     }
     else if (PaymentStatus == 'pending') {
       BookingStatus = 'pending';
       PaymentTextColor= Colors.yellow;
       return PaymentTextColor;
     }
     else {
       BookingStatus = 'pending';
       return Colors.orange;
     }
   }

@override
  Widget build(BuildContext context) {

    return CardWidget(
      height: 91,
      width: 350,
      child: Row(
        children: [
          Container(
              width: 83,
              height: 81,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/gym_logo.png",
                  fit: BoxFit.scaleDown,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Container(
                    width: 187,
                    height: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PoppinText(
                          text: "$GymName",
                          fontsize: 17,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            CategoryTile(GymCategory: "$GymCategory"),
                            SizedBox(width: 5),
                            CategoryTile(GymCategory: "$GymCategory"),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 75,
                    height: 36,
                    // padding: EdgeInsets.only(top: 4),
                    /// status of booking
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        PoppinText(
                          text: "$PaymentStatus"??"null",
                          color: _getTextColor(),
                          fontsize: 12,
                        ),
                        PoppinText(
                          text: "$BookingStatus"??"null",
                          color: Colors.white,
                          fontsize: 12,
                        ),

                      ],
                    ),
                  )
                ]),
                Expanded(
                    child: Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 4,
                            ),
                            PoppinTextlineTrought(
                              text: "₹$actualPrice",
                              fontsize: 12,
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
                              fontsize: 16,
                              color: Color(0xffB3FA3B),
                              fontWeight: FontWeight.bold,
                            ),
                            // PoppinText(text: "19", fontsize: 9,color: Color(0xffB3FA3B),),
                          ],
                        ),
                        Row(
                          children: [
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
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print(" pressed more details");
                          },
                          child: PoppinTextUnderLined(
                            text: 'More Details',
                            fontsize: 11,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                         SizedBox(
                           height: 5,
                         )
                      ],
                    )
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
