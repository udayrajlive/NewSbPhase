import 'package:flutter/material.dart';
import 'package:sb/Components/Card.dart';
import 'package:sb/Components/category_tile.dart';
import 'package:sb/Components/poppintext.dart';

class BookingWidget extends StatelessWidget {
   BookingWidget({Key? key,
    required this.GymName,
    required  this.GymCategory,
    required this.BookingStatus,
    this.offerPrice,
    this.actualPrice,


  }) : super(key: key);

  final String  GymName;
  final String GymCategory;
  final String BookingStatus;
  String ?actualPrice = "45";
  String? offerPrice = "19";






  @override
  Widget build(BuildContext context) {


    return CardWidget(
      height: 61,
      width: 309,
      child: Row(
        children: [
          Container(
              width: 73,
              height: 61,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
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
                    height: 31,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PoppinText(
                          text: "Gold's Gym",
                          fontsize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          children: [
                            CategoryTile(GymCategory: "$GymCategory"),
                            SizedBox(width: 2),
                            CategoryTile(GymCategory: "$GymCategory"),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 44,
                    height: 36,
                    // padding: EdgeInsets.only(top: 4),
                    /// status of booking
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PoppinText(
                          text: "null"??"$BookingStatus",
                          color: Colors.white,
                          fontsize: 6,
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
                              fontsize: 7.5,
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
                              fontsize: 9,
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
                              fontsize: 6,
                            ),
                            PoppinText(
                              text: "session",
                              fontsize: 6,
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
                      width: 110,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print(" pressed more details");
                          },
                          child: PoppinTextUnderLined(
                            text: 'More Details',
                            fontsize: 9.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
