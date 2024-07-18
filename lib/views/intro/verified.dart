import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loginpage.dart';

class Verified extends StatelessWidget {

  Verified({super.key});

  final Color kDarkBlueColor = Color(0xFF2B70B8);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFFFF),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                height: 170.0,
                child: Image.asset("assets/celebration2.gif", fit: BoxFit.contain, ),
                //child: Icon(Icons.check_circle, size: 100, color: Color(0xFF006aa4),),
              ),
              SizedBox(height: 50,),

              Center(child: Text("Congratulations, Your Phone Number has been verified!", textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w200, color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular'),)),

              SizedBox(height: 20,),

              //Center(child: Text("Login and enjoy exclusive travel offers.", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200,  fontFamily: 'ProximaNovaRegular',  color: Colors.black54,  ),)),

              SizedBox(height: 50,),
          ]
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
                  Get.offAll(LoginPage());
                },
                child: const Center(
                    child: Text(
                      "Proceed to Login",
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
