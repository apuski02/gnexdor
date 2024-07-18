//import 'package:exclusivetravel/views/verified.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nextdoor/views/intro/verified.dart';


import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../controllers/login_reg_controller.dart';



class Reg_OTP extends StatelessWidget {

  Reg_OTP({super.key});

  final Color kDarkBlueColor = Color(0xFF2873BA);
  final Login_Reg_Controller controller = Get.put(Login_Reg_Controller());

  String codevalue='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFFFF),

      appBar: AppBar(
        title: Text('Verify Details', style: TextStyle(
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

              /*Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text:  TextSpan(
                      children: [
                        const TextSpan(
                            text: 'We sent an SMS to ',
                            style: TextStyle( fontSize: 16, fontFamily:'ProximaNovaRegular', fontWeight: FontWeight.w300, color: Colors.black)
                        ),
                        TextSpan(
                            text: '08163493224',//text: '$_savedName',
                            style: TextStyle( fontSize: 16, fontFamily:'ProximaNovaRegular',  fontWeight: FontWeight.w700, color: Colors.black)
                        ),
                        TextSpan(
                            text: ' \n Enter the validation code in the SMS to access your account. ',
                            style: TextStyle( fontSize: 16, fontFamily:'ProximaNovaRegular',  fontWeight: FontWeight.w300, color: Colors.black)
                        ),
                      ]),
                ),

              ),*/


              Center(
                child: Text(
                  'Enter the 6 digit verification code sent to your phone number or email address..',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: kDarkBlueColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ProximaNovaRegular'
                  ),
                ),
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
                    print("onCodeChanged $code");
                    //setState(() {  codeValue = code.toString(); });

                    if(code.toString().length==6)
                    {
                      controller.verifying_otp(code.toString());
                      codevalue = code.toString();
                    }
                  },
                  onCodeSubmitted: (val) {
                    print("onCodeSubmitted $val");
                  },
                ),
              ),


              SizedBox(height: 0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.white10),
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    ),
                    onPressed: (){
                    },
                    child: Text('Resend Code', style: TextStyle(fontSize: 14, color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,)),

                  )
                ],
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
                        //Get.off(Verified());
                        controller.verifying_otp(codevalue);
                      },
                      child: const Center(
                          child: Text(
                            "Verify",
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

              //resend code
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
                                    style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),
                                    text: "Code expires in "
                                ),

                                TextSpan(
                                  style: TextStyle(fontSize: 14, color:kDarkBlueColor, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),
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


              /*Obx( ()=>
                ElevatedButton(
                    onPressed: (){
                      controller.enableResend.value ? print('resend now')  : print('waiting');
                    },
                    child: Text('${controller.enableResend.value}')
                )
              ),*/


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
