import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";
import "package:pull_to_refresh/pull_to_refresh.dart";
import "package:sb/Components/Card.dart";
import "package:sb/Components/poppintext.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // RefreshController controller = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1C1E),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              // user details card
              CardWidget(height: 185, width: 350,
               child:  Row(
                 children: [
                   Flexible(
                     flex: 1,
                     child: Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 20, left: 20),
                           child: Stack(
                             children: [
                               CircleAvatar(
                                 backgroundColor: Color(0xff464651),
                                 backgroundImage: AssetImage("assets/user.png"),
                                 radius: 60,
                               ),
                               Container(
                                 width: 120,
                                 height: 120,
                                 decoration: BoxDecoration(
                                     shape: BoxShape.circle,
                                     border: Border.all(
                                       width: 3,
                                       color: Color(0xffB3FA3F),
                                     ),
                                  ),
                               ),
                             ],
                             ),
                         ),
                         // ProfileTile(text: "referal code", prefixImageData: "assets/referal_code.png")
                      ProfileTile(text: "referral code", prefixImageData: "assets/referal_code.png", prefixHeight: 24, prefixWidth: 21, suffixImageData: "assets/copy_icon.png",suffixHeight:13 ,suffixWidth: 13, ontap: (){
                        Fluttertoast.showToast(
                            msg: "Referral Code Copied",);
                      },)
                       ],
                     ),
                   ),
                   Flexible(
                     flex: 1,
                     child: Column(
                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment:  CrossAxisAlignment.start,
                       children:
                     [
                       SizedBox(
                         height: 10,
                       ),

                       Text("User name",style: TextStyle(
                         fontFamily: "Poppins",
                         letterSpacing: 1.5,
                         fontWeight: FontWeight.bold,
                         fontSize: 16,
                         color: Colors.white,
                       ),),


                       ProfileTiledetails(text: "Example@gmail.com", prefixImageData: "assets/mail.png" , prefixHeight: 17, prefixWidth: 20,),
                      ProfileTiledetails(prefixImageData: "assets/icon _call_.png", prefixHeight: 20, prefixWidth: 20, text: "+91-12739230203"),
                      ProfileTiledetails(prefixImageData: "assets/icon _location_.png", prefixHeight: 20, prefixWidth: 20, text: "adress"),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           ProfileTiledetails(prefixImageData: "assets/icon _cake_.png", prefixHeight: 20, prefixWidth: 20, text: "31-01-2001"),
                           GestureDetector(
                             onTap: (){
                               print("Open edit user details ");
                             },
                             child:  Padding(
                               padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                               child: Image.asset("assets/edit_icon.png",width: 30,height: 30),
                             ),
                           )
                         ],
                       )
                     ],
                     ),
                   )
                 ],
               )
              ),
              SizedBox( height: 12,),
              // Pedometer details card
              CardWidget(height: 270, width: 350,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          PoppinText(text: "Today’s Steps", color: Color(0xffB3FA3F),),

                          GestureDetector(
                            onTap: (){
                              print("Change the goal");
                            },
                            child: CardWidget(height: 44, width: 88, color: Color(0xff1D1F2B),
                              padding: EdgeInsets.all(5),
                              child: Column(

                                children: [
                                   PoppinText(text: " Goal 3500", fontsize: 14, color:  Colors.white,),
                                  PoppinText( text: "Tap to change",fontsize: 8, color:  Color(0xffB3FA3F),)

                                ],
                              ) ),
                          )



                        ],

                      ),
                      //widget,
                      Row()
                    ],
                  )
                ),
              SizedBox( height: 12,),
              CardWidget(height: 250 , width: 350)
              
            ],
          ),
        )
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    required this.text,
    required this.prefixImageData,
    required this.prefixHeight,
    required this.prefixWidth,
    required this.suffixHeight,
   required this.suffixWidth,
   required this.suffixImageData,
    required  this.ontap,

    Key? key}) : super(key: key);

  final String text;
  final double suffixWidth;
  final double suffixHeight;
  final double prefixWidth;
  final double prefixHeight;
  final  String prefixImageData;
  final  VoidCallback ontap;
  final  String suffixImageData;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      // margin:  EdgeInsets.only(left: 10, top: 10 ),
      // width: 150,
      // height: 20,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(prefixImageData,width: prefixWidth, height: prefixHeight,),
  SizedBox(
    width: 8,
  ),
            Text("$text",style: TextStyle(
            color: Color(0xff505050),
            fontSize:  13,
            fontFamily: "Poppins",
            ),
            ),
             SizedBox(
               width: 8,
             ),
             InkWell(
               onTap: ontap,
               child: Image.asset(suffixImageData,width: suffixWidth, height:  suffixHeight, ),
             )
          ],

        ),
      ),
    );
  }
}

class ProfileTiledetails extends StatelessWidget {
  const ProfileTiledetails({Key? key,
  required this.prefixImageData,
    required this.prefixHeight,
    required this.prefixWidth,
    required this.text,
  }) : super(key: key);
  final String text;
  final  String prefixImageData;
  final double prefixWidth;
  final double prefixHeight;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(prefixImageData,width: prefixWidth, height: prefixHeight,),
            SizedBox(
              width: 8,
            ),
            Text("$text",style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Color(0xff505050),
              fontSize:  13,
              fontFamily: "Poppins",
            ),
            ),

          ],

        ),
      ),
    );
  }
}
