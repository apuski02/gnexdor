import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextdoor/views/home/home_page.dart';
import 'package:nextdoor/views/intro/regsiter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'forget_password.dart';

class LoginPage extends StatelessWidget {

  LoginPage({super.key});

  final Color kDarkBlueColor = Color(0xFF2873BA);
  final Login_Controller controller = Get.put(Login_Controller());


  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFFFF),

      appBar: AppBar(

        title: Text('Login', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'ProximaNovaRegular'),),

        centerTitle: false,
        backgroundColor: Colors.white,
        automaticallyImplyLeading:false,
        scrolledUnderElevation: 0,
        /*leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xff364D65), // Change Custom Drawer Icon Color
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          //Profile_Icon(),
        ],*/

      ),


      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [



                Obx(() => RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          children: [
                            TextSpan(
                                style: TextStyle(fontSize: 24, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),
                                text: "Welcome, "
                            ),
                            TextSpan(
                                style: TextStyle(fontSize: 22,color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),
                                text: controller.sh_fullname.value,
                            ),
                          ]
                      )),
                ),
        
                SizedBox(height: 30,),


                //email
                TextField(
                  controller: controller.email,
                  enabled: true,
                  keyboardType: TextInputType.text,
                  cursorColor: kDarkBlueColor,
                  //maxLength: 11,
                  style: TextStyle(fontSize: 18, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Color(0xFFF6F7F9),),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(25.0, 20.0, 15.0, 20.0),
                    border: OutlineInputBorder(),

                    filled: true,
                    fillColor: Color(0xFFF6F7F9),
                    //hintText: 'Username',
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Color(0xFFF6F7F9),),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),

                    hintText: 'Email Address or Phone Number',
                    hintStyle: TextStyle(fontSize: 14, color: Color(0xFF8F8D8D), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),
                    suffixIcon: Icon(Icons.email_outlined, size: 20, color: Color(0xFF8F8D8D)),
                  ),

                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                ),

                SizedBox(height: 25,),

                //password
                TextField(
                  controller: controller.password,
                  enabled: true,

                  keyboardType: TextInputType.text,
                  cursorColor: kDarkBlueColor,
                  cursorHeight: 25,
                  //maxLength: 11,
                  obscuringCharacter :'*',
                  obscureText : true,

                  //maxLength: 11,
                  style: TextStyle(fontSize: 18, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Color(0xFFF6F7F9),),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(25.0, 20.0, 15.0, 20.0),
                    border: OutlineInputBorder(),

                    filled: true,
                    fillColor: Color(0xFFF6F7F9),
                    //hintText: 'Username',
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Color(0xFFF6F7F9),),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),

                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 14, color: Color(0xFF8F8D8D), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w500,),
                    suffixIcon: Icon(Icons.lock_outlined, size: 20, color: Color(0xFF8F8D8D)),
                  ),

                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                ),


                //ember me - forget password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Container(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         SizedBox(
                           width: 40,
                           height: 40,
                           child: FittedBox(
                             fit: BoxFit.fill,
                             child: Checkbox(
                               checkColor: Colors.white,
                               fillColor: MaterialStateProperty.all(Color(0xFF2B70B8)),
                               value: true,
                               shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
                               onChanged: (bool? value) { },
                             ),
                           ),
                         ),
                         Text('Remember Me? ', style: TextStyle(fontSize: 15,  color: Colors.black, fontWeight: FontWeight.w200, fontFamily: 'ProximaNovaRegular' ),),

                       ],
                     ),
                   ),
        
                   TextButton(
                        onPressed: (){
                          Get.to(Forget_Password());
                        },
                        child: Text('Forget Password ?', style: TextStyle(fontSize: 15, fontFamily: 'ProximaNovaRegular',  fontWeight: FontWeight.w200, color: Color(0xFF2B70B8),),),
                     style: ButtonStyle(
                       //backgroundColor: MaterialStateProperty.all(Colors.red),
                       //foregroundColor: MaterialStateProperty.all(Colors.white),
                       overlayColor: MaterialStateProperty.all(Colors.transparent),
                      // shadowColor: MaterialStateProperty.all(Colors.red),
                       //surfaceTintColor: MaterialStateProperty.all(Colors.red),
                       elevation: MaterialStateProperty.all(0),
                       padding: MaterialStateProperty.all(EdgeInsets.all(10)),

                     ),
                    )
        
        
                  ],
                ),
        
        
                SizedBox(height: 20,),
        

                //btn
                Container(
                  height: 60,
                  //margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Color(0xFF2B70B8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ButtonTheme(
                    child: TextButton(
                      onPressed: ()
                      {
                        //Get.offAll(Home_Page());
                        controller.do_login();
                      },
                      child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Color(0xFFffffff),
                                fontSize: 16,
                                fontFamily: 'ProximaNovaRegular',
                                fontWeight: FontWeight.w200),
                          )),
                    ),
                  ),
                ),

                SizedBox(height: 25,),

                Center(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          children: [
                            TextSpan(
                                style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),
                                text: "Don’t have an account? "
                            ),
                            TextSpan(
                                style: TextStyle(fontSize: 14,color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w500,),
                                text: "Sign Up",
                                recognizer: TapGestureRecognizer()..onTap =  (){
                                  Get.to(Register());
                                }
                            ),


                          ]
                      )),
                ),






              ],
            ),
          ),
        ),
      ),
    );
  }
}



class Login_Controller extends GetxController {


  final RxString sh_fullname = 'User'.obs;

  @override
  onInit() {
    get_stored_data();
  }


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


  var email = TextEditingController();
  var password = TextEditingController();

  Future<void> do_login() async {


    if( email.text.isEmpty ||  password.text.isEmpty)
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
      if(1 != 1)
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
            title: "",
            titlePadding: EdgeInsets.zero,
            backgroundColor: Colors.black,
            barrierDismissible: false,
            radius: 15,
            content: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 4,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Processing...',
                    style: TextStyle(
                      fontFamily: 'ProximaNovaRegular',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );


          print(email.text);
          print(password.text);



          try
          {

            //await Future.delayed(const Duration(seconds: 3));

            const urlPrefix = 'https://portal.gnexdor.com/api/mobile/v1/Api.php?apicall=user_login';

            final prefs = await SharedPreferences.getInstance();
            //var client_sys_id = prefs.getString('yedc_client_sys_id');

            var map = new Map<String, dynamic>();
            map['email'] =email.text;
            map['password'] =password.text;
            map['Authorization_code'] ="eyJpZCI6NTQsImV4cCI6MTcxNTU5Njc0NiwiaWF0IjoxNzE1NTkzMTQ2fQ";

            final response = await http.post(
              Uri.parse(urlPrefix),
              body: map,
            );

            //print(historyData['user_data']);
            if(response.statusCode == 200)
            {

              //close the processing dialog
              Get.back();


              //print('register controller call firsr');

              final historyData = json.decode(response.body);

              //print(historyData);
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

              }
              else
              {
                //good reg

                var profile = historyData['profile'];
                //print(historyData);
                //print(profile);
                //print(profile[0]['full_name']);
                //print(profile[0]['email']);
                //print(profile[0]['gender']);

                //print(historyData['profile'][0]['full_name']);
                //print(historyData['data']['profile']['dark_mode']);

                //success mark
               /* Get.snackbar(
                  '','',
                  titleText: Text('Success'),
                  messageText: Text(historyData['message'],),
                  duration: Duration(seconds: 2),
                  snackPosition:SnackPosition.TOP,
                  backgroundColor: Colors.green,
                );*/
                //safe profile info to  to pref
                final prefs = await SharedPreferences.getInstance();

                //prefs.setString('nextdoor_login_token', historyData['login_token'].toString());
                prefs.setString('nextdoor_fullname', profile[0]['full_name'].toString());
                prefs.setString('nextdoor_email',profile[0]['email'].toString());
                prefs.setString('nextdoor_gender',profile[0]['gender'].toString());
                prefs.setString('nextdoor_id',profile[0]['id'].toString());

                //geoot home
                Get.offAll(Home_Page());


              }



            }
            else
            {

              print('no working');

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

          }on Exception {
            print('exception error'); //

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
      }


    }




  }


}