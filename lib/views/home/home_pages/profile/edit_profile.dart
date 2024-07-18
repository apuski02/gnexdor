import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../controllers/home_controller.dart';


class Edit_Profile extends StatelessWidget {

  Edit_Profile({super.key});


  final Color kDarkBlueColor = Color(0xFF2873BA);

  //final Home_Controller home_controller = Get.put(Home_Controller());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFFFF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFDFFFF),
        title: Text('Edit Profile', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'Nato'),),
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: true,


      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Center(child: Text('All services Coming Soon')),

              Text('Name', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Aidan East', style: TextStyle(fontSize: 16,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                  IconButton(onPressed: (){}, icon: Icon(Icons.edit, size: 20,)),

                ],
              ),
              Divider(),

              SizedBox(height: 20,),

              Text('Phone', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('+2348163493224', style: TextStyle(fontSize: 16,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                  IconButton(onPressed: (){}, icon: Icon(Icons.edit, size: 20,)),

                ],
              ),
              Divider(),

              SizedBox(height: 20,),


              Text('Email', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('aidaneast@gmail.com', style: TextStyle(fontSize: 16,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                  IconButton(onPressed: (){}, icon: Icon(Icons.edit, size: 20,)),

                ],
              ),
              Divider(),

              SizedBox(height: 20,),





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
