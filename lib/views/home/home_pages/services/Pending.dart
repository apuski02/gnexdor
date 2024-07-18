import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controllers/home_controller.dart';

class Pending extends StatelessWidget {

  Pending({super.key});


  final Color kDarkBlueColor = Color(0xFF2873BA);

  final Home_Controller home_controller = Get.put(Home_Controller());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFFFF),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              // Center(child: Text('All services Coming Soon')),

              Container(
                //height: size.height * 0.9,
                child: ListView.builder(
                  controller: home_controller.controller11,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (context, index) => InkWell(
                    highlightColor: Colors.white,
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    splashColor: Colors.white,
                    onTap:((){
                      //Get.to(() => Flight_Details());
                    }),
                    child: Card(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 35),
                      //color: Color(0xff1e3046)
                      //color: Colors.white,
                      //color: Colors.white,
                      //margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      //elevation: 1,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        //width: 300,
                        //color: Colors.white,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Stack(children: [
                              //image
                              Container(
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  // color: Color(0xFFC30010),
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Image.asset('assets/ser3.png', fit: BoxFit.fill),
                              ),

                              Container(
                                //alignment: Alignment.center,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                  ),

                                  child: Text( 'Pending', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200,  fontFamily: 'ProximaNovaRegular',  fontSize: 12), )),

                            ],),



                            SizedBox(height: 20,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Apartment Cleaning, ', style: TextStyle(fontSize: 18,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                                    Text('By Elizabeth Simon, ', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),),
                                  ],
                                ),

                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.access_time_outlined, size: 15, color: Colors.black54,),
                                      SizedBox(width: 5,),
                                      Text('40 Minutes, ', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),),

                                    ],
                                  ),
                                )
                              ],
                            ),


                            SizedBox(height: 20,),

                            Container(
                              child: Row(
                                children: [
                                  Text('N5,000', style: TextStyle(fontSize: 22,  color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                                  SizedBox(width: 10,),
                                  Text('20% off, ', style: TextStyle(fontSize: 12,  color: Colors.green, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),),

                                ],
                              ),
                            ),


                          ],
                        ),
                      ),


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
