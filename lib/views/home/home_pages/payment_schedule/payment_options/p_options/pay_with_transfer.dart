import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../payment_success.dart';



class Pay_with_transfer extends StatelessWidget {

  Pay_with_transfer({super.key});


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
                padding: EdgeInsets.all(10),
                //margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                decoration: BoxDecoration(
                  color: Color(0xFFE2E7EC),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Account Number:', style: TextStyle(fontSize: 14,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                        Container(
                          child: Row(
                            children: [
                              Text('0054892151', style: TextStyle(fontSize: 14,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                              SizedBox(width: 1,),
                              IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.copy_sharp, size: 15, color: Color(0xFF2873BA),),
                              )

                            ],
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Bank:', style: TextStyle(fontSize: 14,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                        Text('Access Bank', style: TextStyle(fontSize: 14,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),)
                      ],
                    ),

                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Account Name:', style: TextStyle(fontSize: 14,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                        Text('Gnexdoor Corporate', style: TextStyle(fontSize: 14,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),)

                      ],
                    ),

                    SizedBox(height: 35,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total:', style: TextStyle(fontSize: 16,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                        Text('₦10,000', style: TextStyle(fontSize: 18,  color: Color(0xFF2873BA), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),)
                      ],
                    ),



                  ],
                ),
              ),

              SizedBox(height: 30,),

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
                            "Payment made",
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
