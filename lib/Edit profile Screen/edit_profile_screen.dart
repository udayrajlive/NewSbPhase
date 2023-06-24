import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:sb/Components/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sb/Components/Green%20buttom.dart';
import 'package:sb/Edit%20profile%20Screen/FormTextField.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    Key? key,
    required this.name,
    required this.lname,
    required this.email,
    required this.dob,
    required this.weight,
    required this.height,
    required this.imageUrl,
    required this.address,
    required this.gender,
    required this.mobileno,
  }) : super(key: key);
  final String name;
  final String lname;
  final String email;
  final String dob;
  final String weight;
  final String height;
  final String imageUrl;
  final String address;
  final String mobileno;
  final String gender;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController mobileNoController;
  late TextEditingController weightController;
  late TextEditingController heightController;
  // LocationResult? location;
  DateTime dateTime = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  bool maleSelected = false;
  bool femaleSelected = false;
  String address = "";

  DateTime? date = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameController = TextEditingController(text: widget.name);
    lastNameController = TextEditingController(text: widget.lname);
    emailController = TextEditingController(text: widget.email);
    weightController = TextEditingController(text: widget.weight);
    heightController = TextEditingController(text: widget.height);
    mobileNoController = TextEditingController(text: widget.mobileno);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstNameController;
    lastNameController;
    emailController;
    weightController;
    heightController;
    mobileNoController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1C1E),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
            Center(
              child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xff464651),
                        backgroundImage: AssetImage("assets/user.png"),
                        radius: 50,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        // margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 3,
                              color: Colors.white,
                            )),
                      ),
                      Positioned(
                        left: 70,
                        top: 70,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/edit_icon.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FormTextField(
                        validator: (value) {},
                        hint: "John",
                        labelText: "First Name",
                        controller: firstNameController),
                    FormTextField(
                        validator: (value) {},
                        hint: "Snow",
                        labelText: "last Name",
                        controller: lastNameController),
                    FormTextField(
                        validator: (value) {},
                        hint: "Example@gmail.com",
                        labelText: "Email",
                        controller: emailController),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 300,
                      height: 20,
                      child: Text(
                        "Gender",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 300,
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (!femaleSelected && !maleSelected) {
                                  maleSelected = true;
                                }
                                if (femaleSelected) {
                                  femaleSelected = false;
                                  maleSelected = true;
                                }
                              });
                            },
                            child: Container(
                              margin: maleSelected
                                  ? const EdgeInsets.all(0)
                                  : const EdgeInsets.all(0),
                              alignment: Alignment.center,
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: maleSelected
                                    ? Color(0xFFB3FA3F)
                                    : Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Male",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Poppins",
                                color: Colors.white),
                          ),
                          SizedBox(width: 150),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (femaleSelected == false &&
                                    maleSelected == false) {
                                  femaleSelected = true;
                                }
                                if (maleSelected) {
                                  maleSelected = false;
                                  femaleSelected = true;
                                }
                              });
                            },
                            child: Container(
                              margin: femaleSelected
                                  ? const EdgeInsets.all(0)
                                  : const EdgeInsets.all(0),
                              alignment: Alignment.center,
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: femaleSelected
                                    ? Color(0xFFB3FA3F)
                                    : Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Female",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Poppins",
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 300,
                      height: 20,
                      child: Text(
                        "Date of birth",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontSize: 14),
                      ),
                    ),
                    InkWell(

                      borderRadius: BorderRadius.all(Radius.circular(6)),
                        onTap: () => Utils.showSheet(context,
                                child: buildDatePicker(), onClicked: () {
                              final value = DateFormat('dd/MMM/yyyy ')
                                  .format(dateTime);
                              Utils.showSnackBar(context, 'Selected "$value"');

                              Navigator.pop(context);
                            }),
                        child: Container(
                          margin: EdgeInsets.all(6),
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xff2C2C2E),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                    alignment:  Alignment.centerLeft,
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text( "${DateFormat('dd-MMM -yyyy').format(dateTime)}",
                       style:  TextStyle( color: Colors.white,
                       fontSize: 16,
                          fontFamily: "Poppins"
                       ),),
                    ),
                        )

                    ),

                    FormTextField(
                        validator: (value) {},
                        hint: "Weight",
                        suffixText: "KG",
                        controller: weightController),
                    FormTextField(
                        validator: (value) {},
                        hint: "Height",
                        suffixText: "IN",
                        controller: heightController),
                    FormTextField(
                      controller: mobileNoController,
                      validator: (value) {},
                      hint: "+91",
                      labelText: "Mobile No.",
                    ),
                    InkWell(

                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      onTap: () {},
                      child: Container(
                          margin: EdgeInsets.all(6),
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xff2C2C2E),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Pick Location",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    color: Color(0xff505050),
                                    fontSize: 18)),
                          )),
                    ),
                  ],
                )),
            SizedBox(
              height: 27,
            ),
            InkWell(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  Map<String, String> data = {};

                  if (firstNameController.text.isNotEmpty) {
                    data["fname"] = firstNameController.text;
                  }

                  if (lastNameController.text.isNotEmpty) {
                    data["lname"] = lastNameController.text;
                  }
                  if (emailController.text.isNotEmpty) {
                    data["email"] = emailController.text;
                  } else {
                    data["email"] = widget.email;
                  }
                  print("DATES ${date}");
                  if (date != null) {
                    data["dob"] = widget.dob;
                  }
                  if (weightController.text.isNotEmpty) {
                    data["weight"] = weightController.text;
                  }
                  if (heightController.text.isNotEmpty) {
                    data["height"] = heightController.text;
                  }
                  print(maleSelected);
                  if (maleSelected) {
                    data["biodata"] = "Male";
                  } else if (femaleSelected) {
                    data["biodata"] = "Female";
                  } else {
                    data["biodata"] = widget.gender;
                  }
                  print("aDDRESS : ${data['biodata']}");
                  return;
                } else {
                  Fluttertoast.showToast(
                    msg: "All fields are mandatory.",
                  );
                }
              },
              child: GreenButton(
                ontap: (){},
                width: 160,
                heigth: 50,
                text: "Save",
              ),
            ),
            SizedBox(
              height: 27,
            ),
          ],
        ),
      ),
    );
  }

  // TODO: implemented  Custom cupertino Widget
  Widget buildDatePicker() => CupertinoTheme(
        data:  CupertinoThemeData(


          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: TextStyle(

                color: Colors.white, fontFamily: "Poppins", fontSize: 18),
          ),
        ),
        child:Container(
          decoration: BoxDecoration(
            color:Color(0xff2C2C2E),
          ),
          height: 180,
          child: CupertinoDatePicker(
            dateOrder: DatePickerDateOrder.dmy,
            minimumYear: 1960,
            maximumYear: DateTime.now().year,
            initialDateTime: dateTime,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (dateTime) =>
                setState(() => this.dateTime = dateTime),
          ),
        ),
      );
}
