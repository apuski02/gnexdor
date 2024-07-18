import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nextdoor/views/home/home_pages/payment_schedule/payment_success.dart';



class Pay_with_cash extends StatelessWidget {

  Pay_with_cash({super.key});


  final Color kDarkBlueColor = Color(0xFF2873BA);

  //final Home_Controller home_controller = Get.put(Home_Controller());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFFFF),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [

              Container(

                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                //margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                decoration: BoxDecoration(
                  color: Color(0xFFE2E7EC),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Icon(Icons.info, size: 30, color: Colors.black26,),
                    SizedBox(height: 15,),



                    Center(
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),
                                    text: "A cash payment of  "
                                ),
                                TextSpan(
                                    style: TextStyle(fontSize: 14,color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),
                                    text: "₦10,000 ",

                                ),
                                TextSpan(
                                    style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),
                                    text: " should be made to the provider on or before completion of service.  "
                                ),
                              ]
                          )),
                    ),


                  ],
                ),
              ),

              SizedBox(height: 30,),

              //btn
              Container(
                margin: EdgeInsets.all(10),
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
                        Get.to(Payment_success());
                      },
                      child: const Center(
                          child: Text(
                            "Confirm",
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


            ],
          ),
        ),
      ),

    );
  }
}
