import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nextdoor/views/home/home_pages/payment_schedule/schedule.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import '../../../../../controllers/home_controller.dart';


class Notifications extends StatelessWidget {


  Notifications({super.key});



  final Color kDarkBlueColor = Color(0xFF2873BA);

  //final Home_Controller home_controller = Get.put(Home_Controller());
  //final Services_Details_Controller controller = Get.put(Services_Details_Controller());


  // Inject the controller and pass the serviceId as an argument
  //final Services_Details_Controller controller = Get.put(Services_Details_Controller(), permanent: true);
  // Set the argument for the controller


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xFFFDFFFF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFDFFFF),
        title: Text('Notifications', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'Nato'),),
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: true,


      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (BuildContext, index){
            return Card(
              shadowColor: Colors.black,
              color: Colors.white60,
              elevation: 0,
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Icon(Icons.notifications, size: 30, color: Colors.blue,),
                //leading: Text(_MedicalData[index]['type']),
                title: Text('Service Ongoing', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                subtitle: Text('The provider has accepted...'),
                //subtitle: Text(''),

                trailing: Text('24th Mar'),




              ),
            );
          },
          itemCount: 15,
          shrinkWrap: true,
          padding: EdgeInsets.all(5),
          scrollDirection: Axis.vertical,
        ),
      ),
      );


  }
}


