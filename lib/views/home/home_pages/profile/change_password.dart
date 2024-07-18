import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../controllers/home_controller.dart';


class Change_Password extends StatelessWidget {

  Change_Password({super.key});


  final Color kDarkBlueColor = Color(0xFF2873BA);

  //final Home_Controller home_controller = Get.put(Home_Controller());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFFFF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFDFFFF),
        title: Text('Change Password', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'Nato'),),
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: true,


      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Center(
                   child: Text('Please type your new password below.', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

      ),

              SizedBox(height: 40,),

              Text('Current Password', style: TextStyle(fontSize: 14,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

              //password
              TextField(
                //controller: controller.password,
                enabled: true,

                keyboardType: TextInputType.text,
                cursorColor: kDarkBlueColor,
                cursorHeight: 25,
                //maxLength: 11,
                obscuringCharacter :'*',
                obscureText : true,

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

                  hintText: 'Current Password',
                  hintStyle: TextStyle(fontSize: 14, color: Color(0xFF8F8D8D), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w500,),
                  suffixIcon: Icon(Icons.lock_outlined, size: 20, color: Color(0xFF8F8D8D)),
                ),

                autocorrect: false,
                textInputAction: TextInputAction.next,
              ),

              SizedBox(height: 20,),

              Text('New Password', style: TextStyle(fontSize: 14,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

              //password
              TextField(
                //controller: controller.password,
                enabled: true,

                keyboardType: TextInputType.text,
                cursorColor: kDarkBlueColor,
                cursorHeight: 25,
                //maxLength: 11,
                obscuringCharacter :'*',
                obscureText : true,

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

                  hintText: 'New Password',
                  hintStyle: TextStyle(fontSize: 14, color: Color(0xFF8F8D8D), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w500,),
                  suffixIcon: Icon(Icons.lock_outlined, size: 20, color: Color(0xFF8F8D8D)),
                ),

                autocorrect: false,
                textInputAction: TextInputAction.next,
              ),






            ],
          ),
        ),
      ),


      bottomNavigationBar: BottomAppBar(
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
                  //Get.offAll(LoginPage());
                },
                child: const Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                          color: Color(0xFFffffff),
                          fontSize: 14,
                          fontFamily: 'ProximaNovaRegular',
                          fontWeight: FontWeight.w200),
                    )),
              ),
            ),
          ),

        ),
      ),
    );
  }
}
