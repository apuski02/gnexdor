import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nextdoor/views/intro/loginpage.dart';
import 'package:nextdoor/views/intro/regsiter.dart';


class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: OnBoardingSlider(

        headerBackgroundColor: Colors.white,
        finishButtonText: 'Register',
        pageBackgroundColor: Colors.white,
        finishButtonTextStyle : TextStyle(fontSize: 16, color: Colors.white),
        skipIcon : Icon(Icons.arrow_forward, color: Colors.white),
        controllerColor: Color(0xFF2B70B8),
        centerBackground: true,
        hasSkip: true,
        onFinish: (){
          //Get.off(Register());
          Get.to(() => Register());
        },
        /*skipTextButton: ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.menu, color: Colors.white), // icon of the button
          style: ElevatedButton.styleFrom( // styling the button
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            backgroundColor: Colors.green, // Button color
            foregroundColor: Colors.cyan, // Splash color
          ),
        ),*/
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Color(0xFF2B70B8),
          foregroundColor: Color(0xFF2B70B8),
        ),
        //skipTextButton: Text('Skip'),
        skipTextButton: Text( 'Skip', style: TextStyle( fontSize: 16,  color: Color(0xFF2B70B8),  fontWeight: FontWeight.w600,  fontFamily: 'Dosis' )),

        trailing: OutlinedButton(
            child: Text('Login'),
            style: OutlinedButton.styleFrom(
              primary: Color(0xFF2B70B8),
              side: BorderSide(color: Color(0xFF2B70B8)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            onPressed: (){
              Get.off(LoginPage());
            },
          ),
        background: [
          Image.asset('assets/z3.png'),
          Image.asset('assets/z2.png'),
          Image.asset('assets/z1.png'),
          Image.asset('assets/z4.png'),

        ],
        totalPage: 4,
        speed: 2.0,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(   height: 550, ),
                Text('Welcome To Gnexdor', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                SizedBox(height: 8, ),
                Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200, color: Colors.black87),),


              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(   height: 550, ),
                Text('Find Your Service', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                SizedBox(height: 8, ),
                Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200, color: Colors.black87),),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(   height: 550, ),
                Text('Book The Appointment', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                SizedBox(height: 8, ),
                Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200, color: Colors.black87),),


              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(   height: 550, ),
                Text('Payment Gateway', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                SizedBox(height: 8, ),
                Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200, color: Colors.black87),),


              ],
            ),
          ),

        ],
      ),
    );
  }
}


