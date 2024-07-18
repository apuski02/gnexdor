//import 'package:exclusivetravel/views/verified.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nextdoor/views/intro/forget_password_new_password.dart';
import 'package:nextdoor/views/intro/verified.dart';


import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../controllers/login_reg_controller.dart';



class Forget_Password_OTP extends StatelessWidget {

  Forget_Password_OTP({super.key});

  final Color kDarkBlueColor = Color(0xFF2873BA);
  final Login_Reg_Controller controller = Get.put(Login_Reg_Controller());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFFFF),

      appBar: AppBar(
        title: Text('', style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontFamily: 'ProximaNovaRegular',
          fontWeight: FontWeight.w400,
        ),),

        backgroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 10, height: 5, child: DecoratedBox( decoration: BoxDecoration(  color: Colors.black26  ), ),),
                  SizedBox(width: 5,),
                  SizedBox(width: 50, height: 5, child: DecoratedBox( decoration: BoxDecoration(  color: Color(0xFF2B70B8)  ), ),),
                  SizedBox(width: 5,),
                  SizedBox(width: 10, height: 5, child: DecoratedBox( decoration: BoxDecoration(  color: Colors.black26  ), ),),

                ],
              ),

              SizedBox(height: 15,),

              Center(
                child: Text('Enter Verification Code', style: TextStyle(fontSize: 18, fontFamily: 'ProximaNovaRegular', color: Color(0xFF2B70B8), fontWeight: FontWeight.bold)),
              ),


              SizedBox(height: 20,),



              Center(
                child: Text("We’ve sent a verification code via SMS and to the email address linked to your Gnexdor account.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w500),),

              ),



              SizedBox(height: 50,),

              //pin filed
              Center(
                child: PinFieldAutoFill(
                  currentCode: '',
                  codeLength: 6,
                  decoration: BoxLooseDecoration(
                    textStyle: TextStyle(color: Colors.black87, fontSize: 20),
                    strokeColorBuilder:PinListenColorBuilder(Color(0xFFEAECEF), Color(0xFFEAECEF)),
                    bgColorBuilder: PinListenColorBuilder(Color(0xFFEAECEF), const Color(0xFFEAECEF)),
                  ),
                  onCodeChanged: (code) {
                    /*print("onCodeChanged $code");
                    setState(() {
                      codeValue = code.toString();
                    });

                    if(codeValue.length==6)
                    {
                      _fetchData(codeValue);
                    }*/
                  },
                  onCodeSubmitted: (val) {
                    print("onCodeSubmitted $val");
                  },
                ),
              ),


              SizedBox(height: 0,),

              Center(
                child: Obx(() =>
                    TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.white10),
                        elevation: MaterialStateProperty.all(0),
                        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      ),
                      onPressed: (){
                        controller.enableResend.value
                            ?
                        Get.snackbar(
                          'Resending OTP',
                          'Yay! Sending you the OTP again!',
                          snackPosition:SnackPosition.BOTTOM,
                          backgroundColor: Colors.black12,
                        )
                            :
                        null;
                      },
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),
                                    text: "Didn't get the code, Resend in "
                                ),

                                TextSpan(
                                  style: TextStyle(fontSize: 14, color:kDarkBlueColor, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),
                                  text: "${controller.secondsRemaining}",
                                ),
                                TextSpan(
                                    style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),
                                    text: " s"
                                ),



                              ]
                          )),

                    )
                ),
              ),

              SizedBox(height: 45,),


              Container(
                //margin: EdgeInsets.all(10),
                child:  Container(
                  height: 60,
                  //margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                  decoration: BoxDecoration(
                    color: kDarkBlueColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ButtonTheme(
                    child: TextButton(
                      onPressed: ()
                      {
                        Get.to(Forget_Password_New_Password());
                      },
                      child: const Center(
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                                color: Color(0xFFffffff),
                                fontSize: 18,
                                fontFamily: 'ProximaNovaRegular',
                                fontWeight: FontWeight.w200),
                          )),
                    ),
                  ),
                ),

              ),




            ],
          ),
        ),
      ),


      /* bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        notchMargin: 0,
        child: Container(
          //margin: EdgeInsets.all(10),
          child:  Container(
            height: 60,
            //margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
            decoration: BoxDecoration(
              color: kDarkBlueColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ButtonTheme(
              child: TextButton(
                onPressed: ()
                {
                  Get.off(Verified());
                },
                child: const Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Color(0xFFffffff),
                          fontSize: 18,
                          fontFamily: 'ProximaNovaRegular',
                          fontWeight: FontWeight.w200),
                    )),
              ),
            ),
          ),

        ),
      ),*/


    );
  }
}
