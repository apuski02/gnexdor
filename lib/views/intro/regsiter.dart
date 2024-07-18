import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nextdoor/views/intro/loginpage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/login_reg_controller.dart';
import 'otp_verification.dart';

class Register extends StatelessWidget {
  Register({super.key});


  final Color kDarkBlueColor =  Color(0xFF2B70B8);
  final Login_Reg_Controller controller = Get.put(Login_Reg_Controller());


  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFFFF),

      appBar: AppBar(

        title: Text('Create Account', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'ProximaNovaRegular'),),

        centerTitle: false,
        backgroundColor: Colors.white,
        automaticallyImplyLeading:false,
        scrolledUnderElevation: 0,
        /*leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xff364D65), // Change Custom Drawer Icon Color
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          //Profile_Icon(),
        ],*/

      ),


      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [



                Text(
                  'Kindly fill in your details to register an account with Gnexdoor.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: kDarkBlueColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'ProximaNovaRegular'
                  ),
                ),



                SizedBox(height: 40,),


                //fnmae
                TextField(
                  controller: controller.full_name,
                  enabled: true,
                  keyboardType: TextInputType.text,
                  textCapitalization : TextCapitalization.words,
                  cursorColor: kDarkBlueColor,
                  //maxLength: 11,
                  style: TextStyle(fontSize: 18, fontFamily: 'Dosis', fontWeight: FontWeight.bold,),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Color(0xFFF6F7F9),),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(25.0, 20.0, 15.0, 20.0),
                    border: OutlineInputBorder(),

                    filled: true,
                    fillColor: Color(0xFFF6F7F9),
                    //hintText: 'Username',
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Color(0xFFF6F7F9),),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),

                    hintText: 'Full Name',
                    hintStyle: TextStyle(fontSize: 18, color: Color(0xFF8F8D8D), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w500,),
                    suffixIcon: Icon(Icons.person_pin, color: Color(0xFF8F8D8D)),
                  ),

                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                ),

                SizedBox(height: 25,),


                //phone
                TextField(
                  controller: controller.phone_number,
                  enabled: true,
                  keyboardType: TextInputType.number,
                  cursorColor: kDarkBlueColor,
                  maxLength: 11,
                  style: TextStyle(fontSize: 18, fontFamily: 'Dosis', fontWeight: FontWeight.bold,),
                  decoration: InputDecoration(
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Color(0xFFF6F7F9),),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(25.0, 20.0, 15.0, 20.0),
                    border: OutlineInputBorder(),

                    filled: true,
                    fillColor: Color(0xFFF6F7F9),
                    //hintText: 'Username',
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Color(0xFFF6F7F9),),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),

                    hintText: 'Phone Number',
                    hintStyle: TextStyle(fontSize: 18, color: Color(0xFF8F8D8D), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w500,),
                    suffixIcon: Icon(Icons.phone, color: Color(0xFF8F8D8D)),
                  ),

                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                ),

                SizedBox(height: 25,),


                //email
                TextField(
                  controller: controller.email,
                  enabled: true,
                  keyboardType: TextInputType.text,
                  cursorColor: kDarkBlueColor,
                  //maxLength: 11,
                  style: TextStyle(fontSize: 18, fontFamily: 'Dosis', fontWeight: FontWeight.bold,),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Color(0xFFF6F7F9),),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(25.0, 20.0, 15.0, 20.0),
                    border: OutlineInputBorder(),

                    filled: true,
                    fillColor: Color(0xFFF6F7F9),
                    //hintText: 'Username',
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Color(0xFFF6F7F9),),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),

                    hintText: 'Email Address',
                    hintStyle: TextStyle(fontSize: 18, color: Color(0xFF8F8D8D), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w500,),
                    suffixIcon: Icon(Icons.email, color: Color(0xFF8F8D8D)),
                  ),

                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                ),

                SizedBox(height: 25,),

                //username
/*
                TextField(
                  controller: controller.username,
                  enabled: true,
                  keyboardType: TextInputType.text,
                  cursorColor: kDarkBlueColor,
                  //maxLength: 11,
                  style: TextStyle(fontSize: 18, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Color(0xFFF6F7F9),),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(25.0, 20.0, 15.0, 20.0),
                    border: OutlineInputBorder(),

                    filled: true,
                    fillColor: Color(0xFFF6F7F9),
                    //hintText: 'Username',
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Color(0xFFF6F7F9),),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),

                    hintText: 'Username',
                    hintStyle: TextStyle(fontSize: 18, color: Color(0xFF8F8D8D), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w500,),
                    suffixIcon: Icon(Icons.person, color: Color(0xFF8F8D8D)),
                  ),

                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                ),

                SizedBox(height: 25,),
*/

                //password
                TextField(
                  controller: controller.password,
                  enabled: true,

                  keyboardType: TextInputType.text,
                  cursorColor: kDarkBlueColor,
                  cursorHeight: 25,
                  //maxLength: 11,
                  obscuringCharacter :'*',
                  obscureText : true,

                  //maxLength: 11,
                  style: TextStyle(fontSize: 18, fontFamily: 'Dosis', fontWeight: FontWeight.bold,),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Color(0xFFF6F7F9),),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(25.0, 20.0, 15.0, 20.0),
                    border: OutlineInputBorder(),

                    filled: true,
                    fillColor: Color(0xFFF6F7F9),
                    //hintText: 'Username',
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Color(0xFFF6F7F9),),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),

                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 18, color: Color(0xFF8F8D8D), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w500,),
                    suffixIcon: Icon(Icons.lock_outline, color: Color(0xFF8F8D8D)),
                  ),

                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                ),



                SizedBox(height: 55,),


                //sign up btn
                Container(
                  height: 60,
                  //margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Color(0xFF2B70B8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ButtonTheme(
                    child: TextButton(
                      onPressed: ()
                      {
                        //Get.to(Reg_OTP());
                        controller.do_registration();
                      },
                      child: const Center(
                          child: Text(
                            "Proceed",
                            style: TextStyle(
                                color: Color(0xFFffffff),
                                fontSize: 16,
                                fontFamily: 'ProximaNovaRegular',
                                fontWeight: FontWeight.w200),
                          )),
                    ),
                  ),
                ),

                SizedBox(height: 25,),

                Center(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          children: [
                            TextSpan(
                                style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),
                                text: "Already have an account? "
                            ),
                            TextSpan(
                                style: TextStyle(fontSize: 14,color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),
                                text: "Log in",
                                recognizer: TapGestureRecognizer()..onTap =  (){
                                  Get.to(LoginPage());
                                }
                            ),


                          ]
                      )),
                ),




                SizedBox(height: 45,),


                Center(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          children: [
                            TextSpan(
                                style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),
                                text: "By proceeding, I acknowledge that I have read and agreed to GnexDoor’s "
                            ),
                            TextSpan(
                                style: TextStyle(fontSize: 14,color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),
                                text: "Terms and Conditions ",
                                recognizer: TapGestureRecognizer()..onTap =  () async{

                                  final Uri url = Uri.parse('https://pallavtech.com.ng/privacy.php');

                                  if (!await launchUrl(url)) {
                                    throw Exception('Could not launch $url');
                                  }

                                }
                            ),

                            TextSpan(
                                style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),
                                text: " and "
                            ),
                            TextSpan(
                                style: TextStyle(fontSize: 14, color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),
                                text: "Privacy Statement ",
                                recognizer: TapGestureRecognizer()..onTap =  () async{
                                  final Uri url = Uri.parse('https://pallavtech.com.ng/privacy.php');

                                  if (!await launchUrl(url)) {
                                    throw Exception('Could not launch $url');
                                  }
                                }
                            ),
                          ]
                      )),
                ),





              ],
            ),
          ),
        ),
      ),
    );
  }
}
