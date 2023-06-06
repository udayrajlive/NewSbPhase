
import 'package:flutter/material.dart';
import 'package:sb/BMI_screen/textfieldWidget.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  late TextEditingController _controller;
  // String dropdownValue = 'No value';
   String _dropDownValue = 'Gender';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                " Enter body Fat Manually",
                style: TextStyle(color: Colors.white,
                  fontFamily: "Poppins",),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                  hintText: "bodyfat",
                  textController: _controller,
                  suffixText: "%",
                  textInputType: TextInputType.number),
              Container(
                margin: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Or",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Calculate body fat",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 DropdownButtonFormField(
                    decoration:  InputDecoration(
                     hintText: 'Gender',
                      filled: true,
                      fillColor: Color(0xff2C2C2E),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        // borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(6))
                      )
                    ),
                  hint: _dropDownValue == null
                  ? Text('Dropdown')
                      : Text(
                  _dropDownValue,
                  style: TextStyle(color: Color(0xff505050),fontFamily: "Poppins", fontSize: 16 ),
              ),
          isExpanded: true,
          iconSize: 30.0,
          style: TextStyle(color: Colors.white),
          items: ['Male', 'Female', 'Others'].map(
                  (val) {
              return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val, style: TextStyle( fontFamily: "Poppins", fontSize: 16),),
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(
                    () {
                  _dropDownValue = val!;
              },
            );
          },
        ),

                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      hintText: "Age",
                      suffixText: "#",
                      textController: _controller,
                      textInputType: TextInputType.number,
                    ),
                    TextFieldWidget(
                      hintText: "Weight",
                      suffixText: "lbs",
                      textController: _controller,
                      textInputType: TextInputType.number,
                    ),
                    TextFieldWidget(
                      hintText: "Chest",
                      suffixText: "mm",
                      textController: _controller,
                      textInputType: TextInputType.number,
                    ),
                    TextFieldWidget(
                      hintText: "Midaxillary",
                      suffixText: "mm",
                      textController: _controller,
                      textInputType: TextInputType.number,
                    ),
                    TextFieldWidget(
                      hintText: "Abdomen",
                      suffixText: "mm",
                      textController: _controller,
                      textInputType: TextInputType.number,
                    ),
                    TextFieldWidget(
                      hintText: "Hip",
                      suffixText: "mm",
                      textController: _controller,
                      textInputType: TextInputType.number,
                    ),
                    TextFieldWidget(
                      hintText: "Thigh",
                      suffixText: "mm",
                      textController: _controller,
                      textInputType: TextInputType.number,
                    ),
                    TextFieldWidget(
                      hintText: "Tricep",
                      suffixText: "mm",
                      textController: _controller,
                      textInputType: TextInputType.number,
                    ),
                    TextFieldWidget(
                      hintText: "Subscapula",
                      suffixText: "mm",
                      textController: _controller,
                      textInputType: TextInputType.number,
                    ),
                    GestureDetector(
                      child: Container(
                        width: 160,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Color(0xffB3FA3F),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Center(
                          child: Text(
                            "CALCULATE",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily:"Poppins",
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      onTap: (){},
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// TextField(
// decoration: const InputDecoration(
// suffixText: "%",
// suffixStyle: TextStyle(
// fontSize: 16,
// color: Color(0xff505050),
// ),
// hintText: "BodyFat",
// hintStyle: TextStyle(
// fontSize: 16,
// color: Color(0xff505050),
// ),
//
// border: OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(10.0)),
// borderSide: BorderSide(width: 0, color: Colors.transparent),
// ),
// filled: true,
// fillColor: Color(0xff2C2C2E)),
// controller: _controller,
// onSubmitted: (String value) {
// debugPrint(value);
// },
// ),
