import 'package:get/get.dart';
import 'package:nextdoor/views/intro/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/intro/onboarding.dart';
import '../views/intro/onboarding2.dart';


class Splashscreen_controller extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    splash_screen();

    //print('testing');
  }


  Future<void> splash_screen() async {

    await Future.delayed(const Duration(milliseconds: 4000), (){} );

    final prefs = await SharedPreferences.getInstance();
    prefs.getString('nextdoor_active_login');

    var nextdoor_active_login = prefs.getString('nextdoor_active_login');
    if(nextdoor_active_login != null){

        Get.off(LoginPage());
        //print('return use');
    }
    else{

        Get.off(OnBoarding());
        //print('first use');
    }


    //Get.off(OnBoardingPage());

  }



}