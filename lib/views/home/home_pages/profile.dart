import 'dart:io';
//import 'package:exclusivetravel/views/home/pages/screens/profile_icon.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nextdoor/views/home/home_pages/profile/change_password.dart';
import 'package:nextdoor/views/home/home_pages/profile/edit_profile.dart';
import 'package:nextdoor/views/intro/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {

  Profile({super.key});

  final Logout_Controller logout_controller = Get.put(Logout_Controller());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Profile', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Dosis'),),
          centerTitle: true,
          backgroundColor: Colors.white,
          automaticallyImplyLeading:false,
          scrolledUnderElevation: 0,
        ),

        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [

                //profile pic
                Stack(
                  children: [
                    // Profile Image
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 70,
                      backgroundImage: AssetImage('assets/person.png'),
                    ),
                    // Edit Icon
                    Positioned(
                      bottom: 0,
                      right: 5,
                      child: GestureDetector(
                        onTap: () {
                          // Handle edit icon press
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.black54,
                          radius: 20,
                          child: Icon(  Icons.camera_alt, size: 15,  color: Colors.white,  ),
                        ),
                      ),
                    ),
                  ],
                ),



                SizedBox(height: 20,),


                Text('Elizabeth Simon', style: TextStyle(fontSize: 16,  color: Color(0xFF2873BA), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                SizedBox(height: 5,),

                Text('aidaneast@gmail.com', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w400,),),


                SizedBox(height: 20,),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Profile Completeness ', style: TextStyle(fontSize: 16,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                                    SizedBox(height: 5,),

                                    Row(
                                      children: [
                                        //pogress bar
                                        Container(
                                          width: 150,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),

                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 15,),
                                        Text('40% ', style: TextStyle(fontSize: 16,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                                      ],
                                    ),
                                  ],
                                ),

                                //update profie btn
                                Container(
                                  height: 50,
                                  width: 150,
                                  //margin: EdgeInsets.all(10),
                                  //margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF2B70B8),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: ButtonTheme(
                                    child: TextButton(
                                      onPressed: ()
                                      {
                                        Get.to(Edit_Profile());
                                      },
                                      child: const Center(  child: Text("Update Profile",  style: TextStyle( color: Color(0xFFffffff),  fontSize: 14,  fontFamily: 'ProximaNovaRegular',  fontWeight: FontWeight.w200),   )),
                                    ),
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),
                      ),

                      Container(),
                    ],
                  ),
                ),





                SizedBox(height: 25,),


                //profile
                Container(
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
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        //shape: ShapeBorder(),
                        leading: Icon(Icons.edit, size: 20, color: Color(0xFF2873BA),),
                        title: Text('Profile', style: TextStyle(fontSize: 13, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold, color: Colors.black87,)),
                       // subtitle: Text('Edit your personal information.', style: TextStyle(fontSize: 13, color: Colors.black87)),
                        trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20, color: Color(0xFF2873BA),),

                        onTap: ((){
                          Get.to(Edit_Profile());
                        }),

                      ),

                    ],
                  ),
                ),

                SizedBox(height: 20,),


                //password
                Container(
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
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        //shape: ShapeBorder(),
                        leading: Icon(Icons.lock, size: 20, color: Color(0xFF2873BA),),
                        title: Text('Change Password', style: TextStyle(fontSize: 13, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold, color: Colors.black87,)),
                        // subtitle: Text('Edit your personal information.', style: TextStyle(fontSize: 13, color: Colors.black87)),
                        trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20, color: Color(0xFF2873BA),),

                        onTap: ((){
                          Get.to(Change_Password());
                        }),

                      ),

                    ],
                  ),
                ),


                SizedBox(height: 20,),


                //privacy
                Container(
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
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        //shape: ShapeBorder(),
                        leading: Icon(Icons.shield, size: 20, color: Color(0xFF2873BA),),
                        title: Text('Privacy Policy', style: TextStyle(fontSize: 13, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold, color: Colors.black87,)),
                        // subtitle: Text('Edit your personal information.', style: TextStyle(fontSize: 13, color: Colors.black87)),
                        trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20, color: Color(0xFF2873BA),),

                        onTap: ((){

                        }),

                      ),

                    ],
                  ),
                ),


                SizedBox(height: 20,),

                //payment
                Container(
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
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        //shape: ShapeBorder(),
                        leading: Icon(Icons.credit_card, size: 20, color: Color(0xFF2873BA),),
                        title: Text('Payments', style: TextStyle(fontSize: 13, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold, color: Colors.black87,)),
                        // subtitle: Text('Edit your personal information.', style: TextStyle(fontSize: 13, color: Colors.black87)),
                        trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20, color: Color(0xFF2873BA),),

                        onTap: ((){

                        }),

                      ),

                    ],
                  ),
                ),


                SizedBox(height: 20,),

                //setting
                Container(
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
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        //shape: ShapeBorder(),
                        leading: Icon(Icons.settings, size: 20, color: Color(0xFF2873BA),),
                        title: Text('App Settings', style: TextStyle(fontSize: 13, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold, color: Colors.black87,)),
                        // subtitle: Text('Edit your personal information.', style: TextStyle(fontSize: 13, color: Colors.black87)),
                        trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20, color: Color(0xFF2873BA),),

                        onTap: ((){

                        }),

                      ),

                    ],
                  ),
                ),


                SizedBox(height: 20,),


                //support
                Container(
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
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        //shape: ShapeBorder(),
                        leading: Icon(Icons.help, size: 20, color: Color(0xFF2873BA),),
                        title: Text('Support', style: TextStyle(fontSize: 13, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold, color: Colors.black87,)),
                        // subtitle: Text('Edit your personal information.', style: TextStyle(fontSize: 13, color: Colors.black87)),
                        trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20, color: Color(0xFF2873BA),),

                        onTap: ((){

                        }),

                      ),

                    ],
                  ),
                ),


                SizedBox(height: 35,),


                //btn
                Container(
                  width: 120,
                  height: 50,
                  //margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ButtonTheme(
                    child: TextButton(
                      onPressed: ()
                      {
                        //Get.offAll(Home_Page());
                        logout_controller.do_logout();
                      },
                      child: const Center(
                          child: Text(
                            "Logout",
                            style: TextStyle(
                                color: Color(0xFFffffff),
                                fontSize: 16,
                                fontFamily: 'ProximaNovaRegular',
                                fontWeight: FontWeight.w200),
                          )),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}






class Logout_Controller extends GetxController {




  @override
  onInit() {

  }


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


  Future<void> do_logout2() async {

    try
    {

      await Future.delayed(const Duration(seconds: 3));
      const urlPrefix = 'https://api.gnexdor.com/api/user/login/';

      final prefs = await SharedPreferences.getInstance();
      //var client_sys_id = prefs.getString('yedc_client_sys_id');

      var map = new Map<String, dynamic>();
      map['login_token'] ='';
      map['Authorization_code'] ="eyJpZCI6NTQsImV4cCI6MTcxNTU5Njc0NiwiaWF0IjoxNzE1NTkzMTQ2fQ";

      final response = await http.post(
        Uri.parse(urlPrefix),
        body: map,
      );

      //final http.Response response = await http.get(Uri.parse(url));

      //print(historyData['user_data']);
      if(response.statusCode == 200)
      {

        Get.back();


        //print('register controller call firsr');

        final historyData = json.decode(response.body);

        //print(historyData);
        //print(historyData['status']);
        //print(historyData['message']);



        //if(historyData['user_data'].length != 0)
        if(historyData['status'] == false)
        {
          //print("empty data length");

          //error state
          Get.snackbar(
            '','',
            titleText: Text('Warning', style: TextStyle(color: Colors.white),),
            messageText: Text(historyData['message'], style: TextStyle(color: Colors.white),),
            duration: Duration(seconds: 2),
            snackPosition:SnackPosition.TOP,
            backgroundColor: Colors.red,
          );


          /*setState(() {
                      _HistoryData = historyData['user_data'].toList();
                      _isEmpty = false;
                      _isFirstLoadRunning = false;
                      _isNetwork = true;
                    });*/


        }
        else
        {
          //good reg

          //print(historyData);

          //print('going to home data');


          //success mark
          Get.snackbar(
            '','',
            titleText: Text('Success'),
            messageText: Text(historyData['message'],),
            duration: Duration(seconds: 2),
            snackPosition:SnackPosition.TOP,
            backgroundColor: Colors.green,
          );

          //save token to pref
          //final prefs = await SharedPreferences.getInstance();

          Get.offAll(LoginPage());


          /*setState(() {
                      //_isLoading = false;
                      _isFirstLoadRunning = false;
                      _isEmpty = true;
                      _isNetwork = true;
                    });*/
        }



      }
      else
      {

        print('no working');
        /*setState(() {
                    _isFirstLoadRunning = false;
                    //_isLoading = false;
                    _isEmpty = true;
                    _isNetwork = false;
                  });*/

        //ElegantNotification.error(  title:  Text("Error"), description:  Text("Error during connecting to server.")).show(context);


      }

    }on Exception {
      print('exception error'); //
      /*setState(() {
                _isFirstLoadRunning = false;
                //_isLoading = false;
                _isEmpty = true;
                _isNetwork = false;
              });*/

      //ElegantNotification.error(  title:  Text("Error"), description:  Text("Error during connecting to server.")).show(context);
      //SnackBar(content: Text('exception error'), duration: Duration(seconds: 2),);


      // Only catches an exception of type `Exception`.
    }catch (e) {
      print(e); // Catches all types of `Exception` and `Error`.

      /*setState(() {
                _isFirstLoadRunning = false;
                //_isLoading = false;
                _isEmpty = true;
                _isNetwork = false;
              });*/

      //ElegantNotification.error(  title:  Text("Error"), description:  Text("Error during connecting to server.")).show(context);


    }

  }


}


