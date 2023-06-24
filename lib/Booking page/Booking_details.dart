import 'dart:ui';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sb/Components/Card.dart';
import 'package:sb/Components/Green%20buttom.dart';
import 'package:sb/Components/category_tile.dart';
import 'package:sb/Components/poppintext.dart';

class BookingDetails extends StatelessWidget {
  BookingDetails({
    Key? key,
    required this.gymName,
    required this.gymCategory,
    required this.gymAddress,
    required this.bookingStatus,
    required this.paymentStatus,
    required this.paymentTime,
    required this.offerPrice,
    required this.actualPrice,
    required this.startDate,
    required this.endDate,
    required this.bookingTime,
    required this.numberOfPerson,
    required this.discount,
    required this.days,
    required this.paymentMethod,
    this.walletAmount,
  }) : super(key: key);

  final String gymName;
  final String gymCategory;
  late String? bookingStatus;
  final String gymAddress;
  final DateTime paymentTime; // booked on
  final String startDate;
  final String endDate;
  final String bookingTime;
  final String numberOfPerson;
  final String discount;
  final String days;
  final String paymentMethod;
  final String paymentStatus;
  final String? walletAmount;
  final String actualPrice;
  final String offerPrice;

  Color _getBookingColor(String bookingStatus) {
    if (bookingStatus == 'confirmed') {
      return Color(0xffB3FA3F);
    } else if (bookingStatus == 'completed') {
      return Color(0xffA4A4A4);
    } else if (bookingStatus == 'pending') {
      return Color(0xffFFFF30);
    } else if (bookingStatus == 'cancelled') {
      return Color(0xffFF0000);
    } else {
      return Colors.white;
    }
  }

  Color _getPaymentColor(String paymentStatus) {
    if (paymentStatus == 'successfull') {
      return Colors.green;
    } else if (paymentStatus == 'pending') {
      return Color(0xffFFFF30);
    } else if (paymentStatus == 'cancelled'||paymentStatus =='failed') {
      return Color(0xffFF0000);
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    String _Address =
        "Adress of the Gym  thwe name of the game place andt the adresss";
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: CardWidget(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.95,
            borderRadius: 12,
            padding: EdgeInsets.only(top: 20),
            color: _getBookingColor('$bookingStatus'),
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: PoppinText(
                      text: "Booking Status $bookingStatus",
                      fontsize: 18,
                      color: bookingStatus =='failed'||bookingStatus =='cancelled'?Colors.white:Colors.black,
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage('assets/background.jpg',
                                  scale: 2),
                              alignment: Alignment.topCenter,
                              fit: BoxFit.fitWidth),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 5,
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 15,
                              offset: const Offset(0, -1),
                              blurStyle: BlurStyle.normal,
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Row(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                PoppinText(
                                  text: "$gymName",
                                  fontWeight: FontWeight.bold,
                                  fontsize: 20,
                                  color: Colors.white,
                                ),
                                PoppinText(
                                  text: "$gymCategory",
                                  fontWeight: FontWeight.bold,
                                  fontsize: 14,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    categoryTile(
                                      gymCategory: gymCategory,
                                      borderRadius: 2,
                                      width: 50,
                                      height: 14,
                                    ),
                                    categoryTile(
                                      gymCategory: gymCategory,
                                      borderRadius: 2,
                                      width: 50,
                                      height: 14,
                                    ),
                                    categoryTile(
                                      gymCategory: gymCategory,
                                      borderRadius: 2,
                                      width: 50,
                                      height: 14,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 94,
                                  height: 94,
                                  padding: EdgeInsets.all(4),
                                  child: ClipRRect(
                                    child: Image.asset(
                                      "assets/gym_logo.png",
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurStyle: BlurStyle.normal,
                              blurRadius: 5,
                              offset: Offset(0, -4),
                              color: Colors.black.withOpacity(0.50),
                            )
                          ],
                          color: Color(0xff2C2C2E),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      child: Row(
                        ///  address bar
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: SelectableText(
                                    onTap: () {
                                      Clipboard.setData(
                                          ClipboardData(text: _Address));
                                      Fluttertoast.showToast(
                                        msg: "Copied the Address",
                                      );
                                    },
                                    ''' $gymAddress''',
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ))),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Fluttertoast.showToast(
                                      msg: "Opening Maps",
                                    );
                                  },
                                  child: GreenButton(
                                    ontap: (){
                                      /// open the maps for navigation
                                    },
                                    width: 92,
                                    heigth: 30,
                                    text: 'Direction',
                                    fontSize: 16,
                                  )),
                              SizedBox(
                                width: 100,
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Center(
            child: CardWidget(
              height: 510,
              width: MediaQuery.of(context).size.width * 0.95,
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              borderRadius: 12,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PoppinText(
                    text: "Booking Details",
                    color: Color(0xffB3FA3F),
                    fontsize: 16,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PoppinText(
                                text: "Booked On:",
                                fontsize: 16,
                                color: Colors.white,
                              ),
                              PoppinText(
                                text: "Start date:",
                                fontsize: 16,
                                color: Colors.white,
                              ),
                              PoppinText(
                                text: "End date:",
                                fontsize: 16,
                                color: Colors.white,
                              ),
                              PoppinText(
                                text: "Time:",
                                fontsize: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            PoppinText(
                              text: "$paymentTime",
                              fontsize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            PoppinText(
                              text: "$startDate",
                              fontsize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            PoppinText(
                              text: "$endDate",
                              fontsize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PoppinText(
                                  text: "$bookingTime",
                                  fontsize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                MyTooltip(
                                  message:
                                      '''The session is of 1 hour and 30 minutes \n from the Time mentioned''',
                                  child: Container(
                                      width: 15,
                                      height: 15,
                                      child: Image.asset("assets/info.png")),
                                )
                              ],
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MyTooltip(
                                    message: "Number of persons",
                                    child: SizedBox(
                                        width: 23,
                                        height: 23,
                                        child: Image.asset(
                                          "assets/person.png",
                                          fit: BoxFit.contain,
                                        ))),
                                SizedBox(
                                  width: 10,
                                ),
                                PoppinText(
                                  text: "$numberOfPerson",
                                  fontsize: 21,
                                  color: Colors.white,
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MyTooltip(
                                    message: "Discount applied",
                                    child: SizedBox(
                                        width: 25,
                                        height: 25,
                                        child: Image.asset(
                                          "assets/discountshape.png",
                                          fit: BoxFit.contain,
                                        ))),
                                SizedBox(
                                  width: 10,
                                ),
                                PoppinText(
                                  text: "$discount",
                                  fontsize: 21,
                                  color: Colors.white,
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MyTooltip(
                                  message: "Number of days",
                                  child: PoppinText(
                                      text: "Days:",
                                      fontsize: 18,
                                      color: Color(0xffB3FA3F)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                PoppinText(
                                  text: "$days",
                                  fontsize: 21,
                                  color: Colors.white,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    height: 230,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PoppinText(
                                text: "Payment Method",
                                fontsize: 16,
                                color: Color(0xffB3FA3F),
                              ),
                              PoppinText(
                                text: "Payment Status",
                                fontsize: 16,
                                color: Color(0xffB3FA3F),
                              ),
                              PoppinText(
                                text: "Wallet Amount Used",
                                fontsize: 16,
                                color: Color(0xffB3FA3F),
                              ),
                              PoppinText(
                                text: "Actual Price",
                                fontsize: 16,
                                color: Color(0xffB3FA3F),
                              ),
                              PoppinText(
                                text: "Offer Price",
                                fontsize: 16,
                                color: Color(0xffB3FA3F),
                              ),
                              PoppinText(
                                text: "Total Savings",
                                fontsize: 16,
                                color: Color(0xffB3FA3F),
                              ),
                              PoppinText(
                                text: "Total GST",
                                fontsize: 16,
                                color: Color(0xffB3FA3F),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            PoppinText(
                              text: "$paymentMethod",
                              fontsize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            PoppinText(
                              text: "$paymentStatus",
                              fontsize: 16,
                              color: _getPaymentColor(paymentStatus),
                              fontWeight: FontWeight.bold,
                            ),
                            PoppinText(
                              text: "₹ $walletAmount",
                              fontsize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                            PoppinText(
                              text: "₹ $actualPrice",
                              fontsize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                            PoppinText(
                              text: "₹ $offerPrice",
                              fontsize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                            PoppinText(
                              text: "₹ 0.00",
                              fontsize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                            PoppinText(
                              text: "₹ 0.00",
                              fontsize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                  DottedLine(
                    dashColor: Colors.grey,
                    dashGapLength: 2,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 2.5),
                    height: 25,
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PoppinText(
                              text: "Final price",
                              fontsize: 16,
                              color: Color(0xffB3FA3F),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                              PoppinText(
                                text: "₹ 0.00",
                                fontsize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ]))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: CardWidget(
            height: 80,
            width: MediaQuery.of(context).size.width * 0.95,
            borderRadius: 12,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PoppinText(
                      text: "Manage your booking",
                      fontsize: 17,
                      color: Colors.white,
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: PoppinText(
                            text: "Modify booking",
                            color: Color(0xffB3FA3F),
                            fontsize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          onTap: () {
                            print("change the date");
                          },
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: PoppinText(
                            text: "Cancel booking",
                            color: Color(0xffF71138),
                            fontsize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          onTap: () {
                            print("cnacelled the booking ");
                          },
                        ),
                      ],
                    ))
                  ],
                )
              ],
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Center(
              child: GreenButton(
                  width: MediaQuery.of(context).size.width * 0.75,
                  heigth: 42,
                  text: "Explore More", ontap: () {  },)),
          SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}

/// tooltip message widget

class MyTooltip extends StatelessWidget {
  final Widget child;
  final String message;

  MyTooltip({required this.message, required this.child});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      textStyle: TextStyle(
        color: Color(0xffB3FA3F),
        fontFamily: "Poppins",
      ),
      triggerMode: TooltipTriggerMode.tap,
      key: key,
      message: message,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onTap(key),
        child: child,
      ),
    );
  }

  void _onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
  }
}
