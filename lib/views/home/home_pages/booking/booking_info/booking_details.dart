import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import '../../../../../controllers/home_controller.dart';


class Booking_Details extends StatelessWidget {

  Booking_Details({super.key});


  final Color kDarkBlueColor = Color(0xFF2873BA);

  final Home_Controller home_controller = Get.put(Home_Controller());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFFFF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFDFFFF),
        title: Text('Booking Details', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'Nato'),),
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: true,


      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              // Center(child: Text('All services Coming Soon')),


              Container(
                height: 250,
                width: double.infinity,
                child: Image.asset('assets/ser_d.jpg', fit: BoxFit.fill,),
              ),

              SizedBox(height: 15,),

              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      //offset: Offset(1.0, 1.0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Apartment Cleaning ', style: TextStyle(fontSize: 18,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                        Text('ID: 100950', style: TextStyle(fontSize: 12,  color: Colors.black26, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                      ],
                    ),

                    SizedBox(height: 5,),

                    //amt and staus
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('10th May 2024, ', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),),

                        //status
                        Container(
                          //alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFF2B70B8),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Text( 'Request', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200,  fontFamily: 'ProximaNovaRegular',  fontSize: 12), )
                        ),
                      ],
                    ),

                    SizedBox(height: 5,),

                    //amt and staus
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //amt
                        Container(
                          child: Row(
                            children: [
                              Text('₦5,000', style: TextStyle(fontSize: 22,  color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                              SizedBox(width: 10,),
                              Text('20% off, ', style: TextStyle(fontSize: 12,  color: Colors.green, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),),

                            ],
                          ),
                        ),

                        Row(
                          children: [
                            Icon(Icons.access_time_outlined, size: 15, color: Colors.black54,),
                            SizedBox(width: 5,),
                            Text('40 Minutes, ', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),),

                          ],
                        ),

                      ],
                    ),

                  ],

                ),


              ),

              SizedBox(height: 15,),

              //provider info for request, decline and cancel
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
                    Text('Provider', style: TextStyle(fontSize: 18,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                    SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(  child: Image.asset('assets/profile.png')),
                              SizedBox(width: 15,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Elizabeth Simon', style: TextStyle(fontSize: 14, height: 1.2, color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                                    Text('Makeup Artist', style: TextStyle(fontSize: 13, height: 1.2,  color: Colors.blue, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(Icons.star, size: 15, color: Colors.yellow,),
                                          Icon(Icons.star, size: 15, color: Colors.yellow,),
                                          Icon(Icons.star, size: 15, color: Colors.yellow,),
                                          Icon(Icons.star, size: 15, color: Colors.yellow,),
                                          Icon(Icons.star, size: 15, color: Colors.black26,),
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        Container(
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Center(child: Text('4.5', style: TextStyle(fontSize: 12, color: Colors.white),)),
                        )
                      ],
                    ),



                    SizedBox(height: 40,),

                    Container(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // Handle button press
                        },
                        icon: Transform.rotate(angle: -45 * math.pi / 180, child: Icon(Icons.arrow_upward, color: Colors.blue)),
                        label: Text('View Profile', style: TextStyle(color: Colors.blue)),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.blue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(height: 15,),


              //provider info for accepted
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
                    Text('Provider', style: TextStyle(fontSize: 18,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                    SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(  child: Image.asset('assets/profile.png')),
                              SizedBox(width: 15,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Elizabeth Simon', style: TextStyle(fontSize: 14, height: 1.2, color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                                    Text('Makeup Artist', style: TextStyle(fontSize: 13, height: 1.2,  color: Colors.blue, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(Icons.star, size: 15, color: Colors.yellow,),
                                          Icon(Icons.star, size: 15, color: Colors.yellow,),
                                          Icon(Icons.star, size: 15, color: Colors.yellow,),
                                          Icon(Icons.star, size: 15, color: Colors.yellow,),
                                          Icon(Icons.star, size: 15, color: Colors.black26,),
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        Container(
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Center(child: Text('4.5', style: TextStyle(fontSize: 12, color: Colors.white),)),
                        )
                      ],
                    ),



                    SizedBox(height: 40,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              // Handle button press
                            },
                            icon: Icon(Icons.sms, color: Colors.white),
                            label: Text('Message', style: TextStyle(color: Colors.white)),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.blue),
                              backgroundColor: Color(0xFF2B70B8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            ),
                          ),
                        ),

                        Container(
                          width: 150,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              // Handle button press
                            },
                            icon: Transform.rotate(angle: -45 * math.pi / 180, child: Icon(Icons.arrow_upward, color: Colors.blue)),
                            label: Text('View Profile', style: TextStyle(color: Colors.blue)),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.blue),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            ),
                          ),
                        ),
                      ],
                    ),



                  ],
                ),
              ),


              SizedBox(height: 15,),


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


              SizedBox(height: 15,),

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
                        Text('Quantity', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                      ],
                    ),

                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('24th May, 2024', style: TextStyle(fontSize: 14,  color: Colors.black87, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                        Text('2 Units', style: TextStyle(fontSize: 14,  color: Colors.black87, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                      ],
                    ),


                    SizedBox(height: 15,),

                    Text('Location', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                    SizedBox(height: 10,),

                    Text('24 Tombia Rd, Off Circular Junction', style: TextStyle(fontSize: 14,  color: Colors.black87, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),




                  ],
                ),
              ),


              SizedBox(height: 15,),

              //timeline inffo
              Container(
                padding: EdgeInsets.all(20),
                //margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 180,
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
                        Text('Timeline', style: TextStyle(fontSize: 18,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                        Icon(Icons.arrow_forward_ios, size: 15, color: Color(0xFF2873BA),)
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
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ButtonTheme(
                    child: TextButton(
                      onPressed: ()
                      {
                        //Get.to(Payment_success());
                      },
                      child: const Center(
                          child: Text(
                            "Cancel Booking",
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

              SizedBox(height: 20,),

              //btn delete for approved and cancelled
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
                        //Get.to(Payment_success());
                      },
                      child: const Center(
                          child: Text(
                            "Delete Booking",
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

              SizedBox(height: 20,),




            ],
          ),
        ),
      ),

    );
  }
}
