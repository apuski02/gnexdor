import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'package:nextdoor/views/home/home_pages/payment_schedule/payment_options/payments.dart';
import '../../../../controllers/home_controller.dart';


class Service_summay extends StatelessWidget {

  Service_summay({super.key});


  final Color kDarkBlueColor = Color(0xFF2873BA);

  //final Home_Controller home_controller = Get.put(Home_Controller());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFFFF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFDFFFF),
        title: Text('Summary', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'Nato'),),
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: true,


      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Center(child: Text('Kindly confirm the details of your booking before proceeding to make payment.')),

              SizedBox(height: 30,),


              //service inffo
              Container(
                padding: EdgeInsets.all(20),
                //margin: EdgeInsets.all(20),
                width: double.infinity,
                //color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Service', style: TextStyle(fontSize: 16,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w300,),),
                    Text('Apartment Cleaning (x 2)', style: TextStyle(fontSize: 16,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w300,),),

                    SizedBox(height: 20,),

                    Text('Provider', style: TextStyle(fontSize: 16,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w300,),),
                    Text('Elizabeth Simon', style: TextStyle(fontSize: 16,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w300,),),

                    SizedBox(height: 20,),






                  ],
                ),
              ),

              SizedBox(height: 30,),

              //shedule inffo
              Container(
                padding: EdgeInsets.all(20),
                //margin: EdgeInsets.all(20),
                width: double.infinity,
                //color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Schedule Date', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                        Text('Duration', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                      ],
                    ),

                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('24th May, 2024', style: TextStyle(fontSize: 14,  color: Colors.black87, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                        Text('40 Mins', style: TextStyle(fontSize: 14,  color: Colors.black87, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                      ],
                    ),


                    SizedBox(height: 15,),

                    Text('Location', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                    SizedBox(height: 10,),

                    Text('24 Tombia Rd, Off Circular Junction', style: TextStyle(fontSize: 14,  color: Colors.black87, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),




                  ],
                ),
              ),




              SizedBox(height: 30,),

              //price inffo
              Container(
                padding: EdgeInsets.all(20),
                //margin: EdgeInsets.all(20),
                width: double.infinity,
                //color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Price Information', style: TextStyle(fontSize: 18,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                        Icon(Icons.arrow_forward_ios, size: 15, color: Color(0xFF2873BA),)
                      ],
                    ),

                    SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Price', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                        Text('₦ 5,000', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                      ],
                    ),

                    SizedBox(height: 5,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sub-Total', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      style: TextStyle(fontSize: 14, color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),
                                      text: "₦ 5,000"
                                  ),
                                  TextSpan(
                                    style: TextStyle(fontSize: 14,color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),
                                    text: " X ",

                                  ),
                                  TextSpan(
                                      style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),
                                      text: " 2  "
                                  ),
                                  TextSpan(
                                    style: TextStyle(fontSize: 14,color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),
                                    text: " = ",

                                  ),
                                  TextSpan(
                                      style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),
                                      text: " ₦ 10,000  "
                                  ),

                                ]
                            )),
                      ],
                    ),


                    SizedBox(height: 5,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Discount(5%)', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                        Text('-₦ 500', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                      ],
                    ),

                    SizedBox(height: 5,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Coupon(WSA4ED3X)', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                        Text('-₦ 650', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                      ],
                    ),

                    SizedBox(height: 10,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total', style: TextStyle(fontSize: 18,  color: Colors.black87, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                        Text('₦ 8,550', style: TextStyle(fontSize: 18,  color: Colors.black87, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                      ],
                    ),


                  ],
                ),
              ),



              SizedBox(height: 30,),



              //btn cancel for request n pending
              Container(
                //margin: EdgeInsets.all(10),
                child:  Container(
                  height: 60,
                  //margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                  decoration: BoxDecoration(
                    color: kDarkBlueColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ButtonTheme(
                    child: TextButton(
                      onPressed: ()
                      {
                        Get.to(Payments());
                      },
                      child: const Center(
                          child: Text(
                            "Proceed to Pay",
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
