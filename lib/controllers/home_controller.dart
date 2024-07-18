import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nextdoor/views/home/home_pages/booking.dart';
import 'package:nextdoor/views/home/home_pages/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/home/home_pages/home.dart';
import '../views/home/home_pages/profile.dart';
import '../views/intro/loginpage.dart';


class Home_Controller extends GetxController{

  //final _selectedScreenIndex = 0.obs;
  RxInt selectedScreenIndex = 0.obs;

  final List screens2 = [
    {"screen":  Home(), "title": "Home"},
    {"screen":  Booking(), "title": "Booking"},
    {"screen":  Service(), "title": "Service"},
    {"screen":  Profile(), "title": "Profile"},
  ].obs;


  void selectScreen(int index) {
    selectedScreenIndex.value = index;
  }

  // The controller for the ListView
  late ScrollController controller11;

  final RxString sh_fullname = 'User'.obs;


  @override
  void onInit() {

    controller11 = ScrollController();

    get_stored_data();


    // TODO: implement onInit
    super.onInit();
  }



  //get stored data
  get_stored_data() async {

    final prefs = await SharedPreferences.getInstance();
    var nextdoor_fullname = prefs.getString('nextdoor_fullname');
    if(nextdoor_fullname!.isEmpty){
      sh_fullname.value = 'User';
    }
    else{
      sh_fullname.value = nextdoor_fullname;
    }

    //print(sh_fullname);

  }



  //leave home
  Future<void> do_logout() async {
    //await Future.delayed(const Duration(seconds: 3));
    print('doing logout');

    Get.defaultDialog(
      title: "Confirm Action",
      middleText: 'Are you sure you want to log out?',
      backgroundColor: Colors.black,
      titleStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      middleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
      textConfirm: "Log Out",
      textCancel: "Cancel",
      onConfirm: () {
        Get.offAll(LoginPage());
      },
      cancelTextColor: Colors.white,
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      barrierDismissible: true,
      radius: 15,
      contentPadding: EdgeInsets.all(20),
      confirm: ElevatedButton(
        onPressed: () {
          Get.offAll(LoginPage());
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.red, // background color
          onPrimary: Colors.white, // text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text("Log Out"),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.grey, // background color
          onPrimary: Colors.white, // text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text("Cancel"),
      ),
    );



  }


}