import 'dart:async';
import 'dart:convert';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/intro/otp_verification.dart';
import '../views/intro/verified.dart';

class Login_Reg_Controller extends GetxController{


  late  RxInt secondsRemaining = 60.obs;

  RxBool enableResend = false.obs;
  late Timer timer;

  @override
  onInit() {

    super.onInit();

    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
          secondsRemaining--;
      } else {
          enableResend.value = true;
      }
    });



    //_firstLoad();

  }




  var product_list = [].obs;

  var isLoading = true.obs;

 /* void fetchData() async{

    try
    {
      isLoading(true);
      //call remote services
      //var products = await Remote_Services.fetch_products();

      var url = 'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';

      final http.Response response = await http.get(Uri.parse(url));

      if(response.statusCode == 200)
      {
        var json = response.body;
        var products =  productFromJson(json);
        if(products != null)
        {
          product_list.value = products;
        }
      }
      else{
        //show error message
        return null;
      }


    }
    finally{
      isLoading(false);
    }




  }
*/


  sayHello(){
    print("hello world");
  }



  // ↓ place the text editing controller inside your... controller :)
  var full_name = TextEditingController();
  var phone_number = TextEditingController();
  var email = TextEditingController();
  //var username = TextEditingController();
  var password = TextEditingController();


  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  bool _isEmpty = true;
  bool _isEmpty_similar = true;
  bool _isNetwork = true;
  List _HistoryData = [];
  List _SimilarProduct = [];

  Future<void> do_registration() async {

    //setState(() {  _isFirstLoadRunning = true;  });

    //String? deviceId = await PlatformDeviceId.getDeviceId;

    // var url = 'https://api.gnexdor.com/api/provider/register/';

    //print('do registration');

    //print(full_name.text);


    if(full_name.text.isEmpty || phone_number.text.isEmpty || email.text.isEmpty ||  password.text.isEmpty)
    {
        Get.snackbar(
          '','',
          titleText: Text('Warning', style: TextStyle(color: Colors.white),),
          messageText: Text('Major fields are empty', style: TextStyle(color: Colors.white),),
          duration: Duration(seconds: 2),
          snackPosition:SnackPosition.TOP,
          backgroundColor: Colors.red,
        );
    }
    else{
      if(email.text.isEmpty)
      {
          Get.snackbar(
            '','',
            titleText: Text('Warning', style: TextStyle(color: Colors.white),),
            messageText: Text('Please enter a valid email address', style: TextStyle(color: Colors.white),),
            duration: Duration(seconds: 2),
            snackPosition:SnackPosition.TOP,
            backgroundColor: Colors.red,
          );
      }
      else{
        if(password.text.length < 8)
        {
            Get.snackbar(
              '','',
              titleText: Text('Warning', style: TextStyle(color: Colors.white),),
              messageText: Text('Password must be greater than 8 characters.', style: TextStyle(color: Colors.white),),
              duration: Duration(seconds: 2),
              snackPosition:SnackPosition.TOP,
              backgroundColor: Colors.red,
            );
        }
        else{
           //all good here
            Get.defaultDialog(
                title : "",
                backgroundColor: Colors.black,
                titleStyle: TextStyle(color: Colors.white, fontSize: 12),
                //middleTextStyle: TextStyle(color: Colors.white),
                //textConfirm: "Confirm",
                //textCancel: "Cancel",
                //cancelTextColor: Colors.white,
                //confirmTextColor: Colors.white,
                //buttonColor: Colors.red,
                barrierDismissible: false,
                radius: 10,
                content:  Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: Colors.white, strokeWidth: 4),
                      SizedBox(width: 25,),
                      Text('Processing...', style: TextStyle(fontFamily: 'ProximaNovaRegular', fontSize: 14, color: Colors.white),)
                    ],
                  ),
                )
            );


            try
            {

              await Future.delayed(const Duration(seconds: 3));
              //const urlPrefix = 'https://api.gnexdor.com/api/enduser/register/';
              const urlPrefix = "https://portal.gnexdor.com/api/mobile/v1/Api.php?apicall=user_reg";

              final prefs = await SharedPreferences.getInstance();
              //var client_sys_id = prefs.getString('yedc_client_sys_id');

              var map = new Map<String, dynamic>();
              map['full_name'] =full_name.text;
              map['phone_number'] =phone_number.text;
              map['email'] =email.text;
              //map['username'] =username.text;
              map['password'] =password.text;
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

                print(historyData);
                //print(historyData['status']);
                //print(historyData['message']);



                //if(historyData['user_data'].length != 0)
                if(historyData['error'] == true)
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

                  print(historyData);

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
                  final prefs = await SharedPreferences.getInstance();

                  prefs.setString('nextdoor_token', historyData['verify_code'].toString());
                  prefs.setString('nextdoor_fullname', full_name.text);
                    prefs.setString('nextdoor_email', email.text);
                  //prefs.setString('nextdoor_username', username.text);

                  prefs.setString('nextdoor_active_login', 'true');

                  Get.to(Reg_OTP());


                  //print('empty data');
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

                print(response.statusCode);

                Get.back();

                Get.snackbar(
                  '','',
                  titleText: Text('Network Error1', style: TextStyle(color: Colors.white),),
                  messageText: Text('Please check your internet connection and try again!', style: TextStyle(color: Colors.white),),
                  duration: Duration(seconds: 2),
                  snackPosition:SnackPosition.TOP,
                  backgroundColor: Colors.red,
                );
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

              Get.back();

              Get.snackbar(
                '','',
                titleText: Text('Network Error', style: TextStyle(color: Colors.white),),
                messageText: Text('Please check your internet connection and try again!', style: TextStyle(color: Colors.white),),
                duration: Duration(seconds: 2),
                snackPosition:SnackPosition.TOP,
                backgroundColor: Colors.red,
              );



              // Only catches an exception of type `Exception`.
            }catch (e) {
              print(e); // Catches all types of `Exception` and `Error`.

              Get.back();

              Get.snackbar(
                '','',
                titleText: Text('Network Error2', style: TextStyle(color: Colors.white),),
                messageText: Text('Please check your internet connection and try again!', style: TextStyle(color: Colors.white),),
                duration: Duration(seconds: 2),
                snackPosition:SnackPosition.TOP,
                backgroundColor: Colors.red,
              );
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


    }




  }











  //////otp verification
  late RxString otpcode = ''.obs;


  Future<void> verifying_otp(otp_code) async {

    //print(otp_code);

    //all good here
    Get.defaultDialog(
        title : "",
        backgroundColor: Colors.black,
        titleStyle: TextStyle(color: Colors.white, fontSize: 12),
        //middleTextStyle: TextStyle(color: Colors.white),
        //textConfirm: "Confirm",
        //textCancel: "Cancel",
        //cancelTextColor: Colors.white,
        //confirmTextColor: Colors.white,
        //buttonColor: Colors.red,
        barrierDismissible: false,
        radius: 10,
        content:  Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Colors.white, strokeWidth: 4),
              SizedBox(width: 25,),
              Text('Verifying...', style: TextStyle(fontFamily: 'ProximaNovaRegular', fontSize: 14, color: Colors.white),)
            ],
          ),
        )
    );


    try
    {

      await Future.delayed(const Duration(seconds: 3));
      const urlPrefix = 'https://portal.gnexdor.com/api/mobile/v1/Api.php?apicall=otp_verification';

      final prefs = await SharedPreferences.getInstance();
      var nextdoor_email = prefs.getString('nextdoor_email');


      var map = new Map<String, dynamic>();
      map['email'] =nextdoor_email;
      map['verify_code'] =otp_code;
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

        print(historyData);
        //print(historyData['status']);
        //print(historyData['message']);



        //if(historyData['user_data'].length != 0)
        if(historyData['error'] == true)
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

          print(historyData);

          //good reg
          Get.snackbar(
            '','',
            titleText: Text('Success'),
            messageText: Text(historyData['message'],),
            duration: Duration(seconds: 2),
            snackPosition:SnackPosition.TOP,
            backgroundColor: Colors.green,
          );


          Get.off(Verified());


          //print('empty data');
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
        Get.back();

        print('no working');
        Get.snackbar(
          '','',
          titleText: Text('Network Error', style: TextStyle(color: Colors.white),),
          messageText: Text('Please kindly check your network connection.!', style: TextStyle(color: Colors.white),),
          duration: Duration(seconds: 2),
          snackPosition:SnackPosition.TOP,
          backgroundColor: Colors.red,
        );


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

      Get.back();
      Get.snackbar(
        '','',
        titleText: Text('Network Error', style: TextStyle(color: Colors.white),),
        messageText: Text('Please kindly check your network connection.!', style: TextStyle(color: Colors.white),),
        duration: Duration(seconds: 2),
        snackPosition:SnackPosition.TOP,
        backgroundColor: Colors.red,
      );
      //ElegantNotification.error(  title:  Text("Error"), description:  Text("Error during connecting to server.")).show(context);
      //SnackBar(content: Text('exception error'), duration: Duration(seconds: 2),);


      // Only catches an exception of type `Exception`.
    }catch (e) {
      print(e); // Catches all types of `Exception` and `Error`.

      Get.back();
      Get.snackbar(
        '','',
        titleText: Text('Network Error', style: TextStyle(color: Colors.white),),
        messageText: Text('Please kindly check your network connection.!', style: TextStyle(color: Colors.white),),
        duration: Duration(seconds: 2),
        snackPosition:SnackPosition.TOP,
        backgroundColor: Colors.red,
      );

      /*setState(() {
                _isFirstLoadRunning = false;
                //_isLoading = false;
                _isEmpty = true;
                _isNetwork = false;
              });*/

      //ElegantNotification.error(  title:  Text("Error"), description:  Text("Error during connecting to server.")).show(context);


    }

  }






  ///login welcome











}