import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nextdoor/views/home/home_pages/payment_schedule/payment_options/payments.dart';
import 'package:nextdoor/views/home/home_pages/payment_schedule/service_summary.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import '../../../../../controllers/home_controller.dart';


class Schedule extends StatelessWidget {

  //final int serviceId;
  //Services_Details(this.serviceId, {super.key});

  Schedule({super.key});



  final Color kDarkBlueColor = Color(0xFF2873BA);

  //final Home_Controller home_controller = Get.put(Home_Controller());
  //final Services_Details_Controller controller = Get.put(Services_Details_Controller());


  // Inject the controller and pass the serviceId as an argument
  //final Services_Details_Controller controller = Get.put(Services_Details_Controller(), permanent: true);
  // Set the argument for the controller


  @override
  Widget build(BuildContext context) {

    //final Services_Details_Controller controller = Get.put(Services_Details_Controller(), permanent: true);
    //controller.serviceId.value = serviceId;


    return Scaffold(
      backgroundColor: Color(0xFFFDFFFF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFDFFFF),
        title: Text('Schedule', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'Nato'),),
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: true,


      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('Kindly select the date, location and quantity for this booking', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),),

              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //minus
                  Container(
                    height: 70,
                    width: 70,
                    //margin: EdgeInsets.all(10),
                    //margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                    decoration: BoxDecoration(
                      color: Color(0xFF2B70B8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ButtonTheme(
                      child: TextButton(
                        onPressed: ()
                        {
                        },
                        child: const Center(  child: Text("-",  style: TextStyle( color: Color(0xFFffffff),  fontSize: 40,  fontFamily: 'ProximaNovaRegular',  fontWeight: FontWeight.w200),   )),
                      ),
                    ),
                  ),

                  Container(
                    height: 70,
                    width: 170,
                    //margin: EdgeInsets.all(10),
                    //margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                    decoration: BoxDecoration(
                      color: Color(0xFFE2E7EC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(  child: Text("1 Unit",  style: TextStyle( color: Color(0xFF2B70B8),  fontSize: 25,  fontFamily: 'ProximaNovaRegular',  fontWeight: FontWeight.w200),   )),
                  ),

                  //add
                  Container(
                    height: 70,
                    width: 70,
                    //margin: EdgeInsets.all(10),
                    //margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                    decoration: BoxDecoration(
                      color: Color(0xFF2B70B8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ButtonTheme(
                      child: TextButton(
                        onPressed: ()
                        {
                        },
                        child: const Center(  child: Text("+",  style: TextStyle( color: Color(0xFFffffff),  fontSize: 40,  fontFamily: 'ProximaNovaRegular',  fontWeight: FontWeight.w200),   )),
                      ),
                    ),
                  ),

                ],
              ),


              SizedBox(height: 40,),

              Text('Select Date & Time', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

              TextField(
                //controller: controller.email,
                enabled: true,
                keyboardType: TextInputType.datetime,
                cursorColor: kDarkBlueColor,
                //maxLength: 11,
                style: TextStyle(fontSize: 18, fontFamily: 'Dosis', fontWeight: FontWeight.bold,),
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

                  hintText: 'Date & Time',
                  hintStyle: TextStyle(fontSize: 18, color: Color(0xFF8F8D8D), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w500,),
                  suffixIcon: Icon(Icons.calendar_month, color: Color(0xFF2B70B8)),
                ),

                autocorrect: false,
                textInputAction: TextInputAction.next,
              ),




              SizedBox(height: 40,),

              Text('Location', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

              TextField(
                //controller: controller.email,
                enabled: true,
                keyboardType: TextInputType.streetAddress,
                cursorColor: kDarkBlueColor,
                //maxLength: 11,
                style: TextStyle(fontSize: 18, fontFamily: 'Dosis', fontWeight: FontWeight.bold,),
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

                  hintText: 'Town/City',
                  hintStyle: TextStyle(fontSize: 18, color: Color(0xFF8F8D8D), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w500,),
                  suffixIcon: Icon(Icons.pin_drop_rounded, color: Color(0xFF2B70B8)),
                ),

                autocorrect: false,
                textInputAction: TextInputAction.next,
              ),

              SizedBox(height: 70,),





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
                  Get.to(Service_summay());
                },
                child: const Center(
                    child: Text(
                      "Confirm",
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


class Schedule_Controller extends GetxController {


  final RxString sh_fullname = 'User'.obs;

  // The controller for the ListView
  late ScrollController controller11;


  var serviceId = 0.obs;

  @override
  void onInit() {
    super.onInit();

    controller11 = ScrollController();

    print('details  onit' + serviceId.value.toString());
    // get_stored_data();

    do_get_service_details();

    serviceId.value = Get.arguments ?? 0;

  }

  @override
  void initState() {
    //super.initState();
    //print('hi there');
    // Or call your function here
  }


  @override
  void onReady() {
    super.onReady();

    print('page ready');
    // perform database operation
    do_get_service_details();
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



  RxBool _isLoading = true.obs;
  RxBool _isEmpty = true.obs;
  RxList _HistoryData = [].obs;

  Future<void> do_get_service_details() async {

    await Future.delayed(const Duration(seconds: 1));

    var urlPrefix = 'https://api.gnexdor.com/api/service/view/';

    try
    {
      var map = new Map<String, dynamic>();
      map['service_id'] = serviceId.value.toString();
      map['Authorization_code'] ="eyJpZCI6NTQsImV4cCI6MTcxNTU5Njc0NiwiaWF0IjoxNzE1NTkzMTQ2fQ";

      final response = await http.post(
        Uri.parse(urlPrefix),
        body: map,
      );

      //final http.Response response = await http.get(Uri.parse(url));

      if(response.statusCode == 200)
      {


        final historyData = json.decode(response.body);

        print(historyData);
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
          print(historyData['data']("title"));
          //print(historyData['data']['profile']['dark_mode']);

          //success mark
          Get.snackbar(
            '','',
            titleText: Text('Success'),
            messageText: Text(historyData['message'],),
            duration: Duration(seconds: 2),
            snackPosition:SnackPosition.TOP,
            backgroundColor: Colors.green,
          );


          _HistoryData.value = historyData['data'].toList();
          _isEmpty.value = false;
          _isLoading.value = false;

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

        print('no working' + response.statusCode.toString());

        //Get.back();

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

      // Get.back();
      Get.snackbar(
        '','',
        titleText: Text('Network Error excep ee', style: TextStyle(color: Colors.white),),
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

      // Get.back();
      Get.snackbar(
        '','',
        titleText: Text('Network Error ee2', style: TextStyle(color: Colors.white),),
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

