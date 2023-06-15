import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sb/BMI_screen/BMI_screen.dart';
import 'package:sb/Booking%20page/Bookings.dart';
import 'package:sb/Edit%20profile%20Screen/edit_profile_screen.dart';
import 'package:sb/Profile_page/profile_page_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: Colors.lightGreen,

        ),
        appBarTheme:  AppBarTheme(
          color: Colors.transparent,
        ),

        useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.white).copyWith(background: Color(0x505050)).copyWith(background: Color(0xff1C1C1E)),
      ),
      // home:  BMIPage(),
      // home: EditProfileScreen(name: 'uday', lname: '', email: '', weight: '', dob: '', imageUrl: '', address: '', height: '', gender: '', mobileno: '',),
    home: ProfilePage(),
    //   home : BookingPage(totalBookings: '1',)
    );
  }
}