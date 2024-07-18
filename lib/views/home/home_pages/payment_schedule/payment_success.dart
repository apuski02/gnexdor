import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nextdoor/views/home/home_pages/home.dart';
import 'package:nextdoor/views/home/home_pages/payment_schedule/payment_options/payments.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import '../../../../../controllers/home_controller.dart';
import '../../home_page.dart';


class Payment_success extends StatelessWidget {

  //final int serviceId;
  //Services_Details(this.serviceId, {super.key});

  Payment_success({super.key});



  final Color kDarkBlueColor = Color(0xFF2873BA);

  //final Home_Controller home_controller = Get.put(Home_Controller());
  //final Services_Details_Controller controller = Get.put(Services_Details_Controller());


  // Inject the controller and pass the serviceId as an argument
  //final Services_Details_Controller controller = Get.put(Services_Details_Controller(), permanent: true);
  // Set the argument for the controller


  @override
  Widget build(BuildContext context) {

    //final Services_Details_Controller controller = Get.put(Services_Details_Controller(), permanent: true);
    //controller.serviceId.value = serviceId;


    return Scaffold(
      backgroundColor: Color(0xFFFDFFFF),


      body: Center(
        child: Container(
          height: 300,
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.all(20),
          //margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
          decoration: BoxDecoration(
            color: Color(0xFFE2E7EC),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [

              Center(
                child: Text('Payment Sucessfully.', style: TextStyle(fontSize: 16,  color: Color(0xFF2873BA), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),)
                ,
              ),

              SizedBox(height: 25,),

              Image.asset('assets/shield-check.png'),
              SizedBox(height: 15,),



              Center(
                child: Text('You have reviewed this service. Thank you for using Gnexdoor.', style: TextStyle(fontSize: 14,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),)
              ),


              SizedBox(height: 15,),


              Container(
                margin: EdgeInsets.all(10),
                child:  Container(
                  height: 50,
                  //margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                  decoration: BoxDecoration(
                    color: kDarkBlueColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ButtonTheme(
                    child: TextButton(
                      onPressed: ()
                      {
                        Get.offAll(Home_Page());
                      },
                      child: const Center(
                          child: Text(
                            "Return Home",
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

