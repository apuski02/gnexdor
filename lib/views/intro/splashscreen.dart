import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/splashscreen_controller.dart';


class Splash_screen extends StatelessWidget {
  Splash_screen({super.key});

  final Splashscreen_controller controller = Get.put(Splashscreen_controller());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFF2873BA),


      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo_dark.png', height: 198, width: 198,),
            SizedBox(height: 20,),

           /* Text(
              'Lutheran\nGuide',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'Nato',
                fontWeight: FontWeight.w400,
                //height: 0.02,
                //letterSpacing: -0.25,
              ),
            ),*/
          ],
        ),

      ),



    );
  }

}
