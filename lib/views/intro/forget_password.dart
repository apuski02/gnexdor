
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nextdoor/views/intro/forget_password_otp.dart';

import 'otp_verification.dart';


class Forget_Password extends StatelessWidget {
   Forget_Password({super.key});

   final Color kDarkBlueColor = Color(0xFF2873BA);


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(''),
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
                  SizedBox(width: 50, height: 5, child: DecoratedBox( decoration: BoxDecoration(  color: Color(0xFF2B70B8)  ), ),),
                  SizedBox(width: 5,),
                  SizedBox(width: 10, height: 5, child: DecoratedBox( decoration: BoxDecoration(  color: Colors.black26  ), ),),
                  SizedBox(width: 5,),
                  SizedBox(width: 10, height: 5, child: DecoratedBox( decoration: BoxDecoration(  color: Colors.black26  ), ),),

                ],
              ),

              SizedBox(height: 15,),

              Center(
                child: Text('Password Forgotten', style: TextStyle(fontSize: 18, fontFamily: 'ProximaNovaRegular', color: Color(0xFF2B70B8), fontWeight: FontWeight.bold)),
              ),


              SizedBox(height: 20,),



              Center(
                child: Text('Please enter the phone number or email address associated with your Gnexdoor account.', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w500),),

              ),

              SizedBox(height: 50,),

              //email
              TextField(
                //controller: searchText,
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
              //btn
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
                      Get.to(Forget_Password_OTP());
                    },
                    child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Color(0xFFffffff),
                              fontSize: 16,
                              fontFamily: 'ProximaNovaRegular',
                              fontWeight: FontWeight.w200),
                        )),
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
              borderRadius: BorderRadius.circular(5),
            ),
            child: ButtonTheme(
              child: TextButton(
                onPressed: ()
                {
                  Get.to(Reg_OTP());
                },
                child: const Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Color(0xFFffffff),
                          fontSize: 18,
                          fontFamily: 'Dosis',
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ),

        ),
      ),*/
    );
  }
}
