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


class Services_Details extends StatelessWidget {

  final int serviceId;
  Services_Details(this.serviceId, {super.key});


  final Color kDarkBlueColor = Color(0xFF2873BA);

  //final Home_Controller home_controller = Get.put(Home_Controller());
  //final Services_Details_Controller controller = Get.put(Services_Details_Controller());


  // Inject the controller and pass the serviceId as an argument
  //final Services_Details_Controller controller = Get.put(Services_Details_Controller(), permanent: true);
  // Set the argument for the controller


  @override
  Widget build(BuildContext context) {

    final Services_Details_Controller controller = Get.put(Services_Details_Controller(), permanent: true);

    controller.serviceId.value = serviceId;


    return Scaffold(
      backgroundColor: Color(0xFFFDFFFF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFDFFFF),
        title: Text('Services Details', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'Nato'),),
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: true,


      ),

      body: SingleChildScrollView(
        child: Container(
          //padding: EdgeInsets.all(10),
          child: Column(
              children: [
                // Center(child: Text('All services Coming Soon')),

                //Text('Received ID: ${controller.serviceId.value}'),

                Container(
                  height: 250,
                  width: double.infinity,
                  child: Image.asset('assets/ser_d.jpg', fit: BoxFit.fill,),
                ),

                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  //width: 300,
                  //color: Colors.white,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //Text(controller._HistoryData.value[0]['title'].toString(), style: TextStyle(fontSize: 18,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                      Text('Painting One room', style: TextStyle(fontSize: 18,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                      SizedBox(height: 10,),

                      Row(
                        children: [
                          Text('₦ 3400', style: TextStyle(fontSize: 22,  color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,)),
                          SizedBox(width: 10,),
                          Text('10% off', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,)),
                        ],
                      ),

                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Duration', style: TextStyle(fontSize: 16,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,)),
                          Text('4 Hours', style: TextStyle(fontSize: 14,  color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,)),

                        ],
                      ),

                      SizedBox(height: 5,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Rating', style: TextStyle(fontSize: 16,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,)),
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.star,size: 18, color: Colors.yellow,),
                                SizedBox(width: 5,),
                                Text('4.5', style: TextStyle(fontSize: 14,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,)),
                              ],
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),


                SizedBox(height: 5,),

                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description', style: TextStyle(fontSize: 16,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,)),
                      Text('It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ', style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,)),

                    ],
                  ),
                ),


                SizedBox(height: 20,),

                //btn
                Container(
                  height: 50,
                  margin: EdgeInsets.all(10),
                  //margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Color(0xFF2B70B8),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: ButtonTheme(
                    child: TextButton(
                      onPressed: ()
                      {
                        Get.to(Schedule());
                        //controller.do_login();
                      },
                      child: const Center(  child: Text(  "Book",  style: TextStyle( color: Color(0xFFffffff),  fontSize: 16,  fontFamily: 'ProximaNovaRegular',  fontWeight: FontWeight.w200),   )),
                    ),
                  ),
                ),

                SizedBox(height: 10,),


                //providr inffo
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  //color: Colors.white,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Provider', style: TextStyle(fontSize: 18,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(  child: Image.asset('assets/profile.png')),
                                SizedBox(width: 15,),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Elizabeth Simon', style: TextStyle(fontSize: 14, height: 1.2, color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                                      Text('Makeup Artist', style: TextStyle(fontSize: 13, height: 1.2,  color: Colors.blue, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.star, size: 15, color: Colors.yellow,),
                                            Icon(Icons.star, size: 15, color: Colors.yellow,),
                                            Icon(Icons.star, size: 15, color: Colors.yellow,),
                                            Icon(Icons.star, size: 15, color: Colors.yellow,),
                                            Icon(Icons.star, size: 15, color: Colors.black26,),
                                          ],
                                        ),
                                      )

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          Container(
                            width: 35,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Center(child: Text('4.5', style: TextStyle(fontSize: 12, color: Colors.white),)),
                          )
                        ],
                      ),



                      SizedBox(height: 40,),

                      Container(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            // Handle button press
                          },
                          icon: Transform.rotate(angle: -45 * math.pi / 180, child: Icon(Icons.arrow_upward, color: Colors.blue)),
                          label: Text('View Profile', style: TextStyle(color: Colors.blue)),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.blue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 20,),


                //galleey
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.all(Radius.circular(10)),

                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Gallery', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Nato'),),

                          Text('See all', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Nato'),)
                        ],
                      ),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7 ,// _HistoryData.length,
                          itemBuilder: (context, index) => InkWell(
                            highlightColor: Colors.white,
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            splashColor: Colors.white,
                            onTap:((){
                              //Navigator.push (context, MaterialPageRoute(builder: (BuildContext context) => Shop_Items(_HistoryData[index]['shop_id'], _HistoryData[index]['shop_name']),));
                              //Get.to(() => Hotel_Details());
                            }),
                            child: Card(

                              //color: Color(0xff1e3046)
                              color: Colors.white,
                              //color: Colors.black12,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                //borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                                side: BorderSide(
                                  color: Colors.black45,
                                  width: 0,
                                ),
                              ),
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.all(15),
                                width: 120,
                                decoration: BoxDecoration(
                                  //borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage("assets/ser1.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                  ],
                                ),
                              ),


                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),





                SizedBox(height: 10,),


                //reviews
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Reviews', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Nato'),),

                          Text('See all', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Nato'),)
                        ],
                      ),
                      SizedBox(height: 5,),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.asset('assets/profile.png'),
                          ),

                          SizedBox(width: 10,),

                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('Adaaa Richard', style: TextStyle(fontSize: 14,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,)),
                                    SizedBox(width: 20,),
                                    Text('10 Dec', style: TextStyle(fontSize: 12,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,)),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Icon(Icons.star, size: 15, color: Colors.yellow,),
                                    Icon(Icons.star, size: 15, color: Colors.yellow,),
                                    Icon(Icons.star, size: 15, color: Colors.yellow,),
                                    Icon(Icons.star, size: 15, color: Colors.black26,),
                                    Icon(Icons.star, size: 15, color: Colors.black26,),

                                    SizedBox(width: 10,),

                                    Text('4.5')

                                  ],
                                ),

                                SizedBox(height: 10,),

                                Container(width:MediaQuery.of(context).size.width /1.5, child: Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet. ' , style: TextStyle(fontSize: 13,  color: Colors.black87, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,))),

                              ],
                            ),
                          )
                        ],
                      ),

                      SizedBox(height: 25,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.asset('assets/profile.png'),
                          ),

                          SizedBox(width: 10,),

                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('Adaaa Richard', style: TextStyle(fontSize: 14,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,)),
                                    SizedBox(width: 20,),
                                    Text('10 Dec', style: TextStyle(fontSize: 12,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,)),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Icon(Icons.star, size: 15, color: Colors.yellow,),
                                    Icon(Icons.star, size: 15, color: Colors.yellow,),
                                    Icon(Icons.star, size: 15, color: Colors.yellow,),
                                    Icon(Icons.star, size: 15, color: Colors.black26,),
                                    Icon(Icons.star, size: 15, color: Colors.black26,),

                                    SizedBox(width: 10,),

                                    Text('4.5')

                                  ],
                                ),

                                SizedBox(height: 10,),

                                Container(width:MediaQuery.of(context).size.width /1.5, child: Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet. ' , style: TextStyle(fontSize: 13,  color: Colors.black87, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,))),

                              ],
                            ),
                          )
                        ],
                      ),

                      SizedBox(height: 25,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.asset('assets/profile.png'),
                          ),

                          SizedBox(width: 10,),

                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('Adaaa Richard', style: TextStyle(fontSize: 14,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,)),
                                    SizedBox(width: 20,),
                                    Text('10 Dec', style: TextStyle(fontSize: 12,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,)),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Icon(Icons.star, size: 15, color: Colors.yellow,),
                                    Icon(Icons.star, size: 15, color: Colors.yellow,),
                                    Icon(Icons.star, size: 15, color: Colors.yellow,),
                                    Icon(Icons.star, size: 15, color: Colors.black26,),
                                    Icon(Icons.star, size: 15, color: Colors.black26,),

                                    SizedBox(width: 10,),

                                    Text('4.5')

                                  ],
                                ),

                                SizedBox(height: 10,),

                                Container(width:MediaQuery.of(context).size.width /1.5, child: Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet. ' , style: TextStyle(fontSize: 13,  color: Colors.black87, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,))),

                              ],
                            ),
                          )
                        ],
                      ),


                    ],
                  ),
                ),



                //releared services

                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Related Services', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Nato'),),

                        ],
                      ),


                      Container(
                        height: 280,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 12 ,// _HistoryData.length,
                          itemBuilder: (context, index) => InkWell(
                            highlightColor: Colors.white,
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            splashColor: Colors.white,
                            onTap:((){
                               Get.off(() => Services_Details(2));
                              //print('relted');
                            }),
                            child: Container(
                              height: 210,
                              width: 300,
                              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              //color: Color(0xffE0E0E0),
                              child: Stack(children: <Widget>[
                                Stack(
                                  alignment: Alignment.topLeft,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 150 / 2.0, ),  ///here we create space for the circle avatar to get ut of the box
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                                        height: 290.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.0),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 5.0,
                                              //offset: Offset(1.0, 1.0),
                                            ),
                                          ],
                                        ),
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 90,),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment : CrossAxisAlignment.start,
                                                    children: [

                                                      Text('Painting Single Room', style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                                                      SizedBox(height: 5,),

                                                      Row(
                                                        children: [
                                                          Text('Ratings: ', style: TextStyle(fontSize: 15, color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                                                          SizedBox(width: 2,),

                                                          Icon(Icons.star, color: Colors.amberAccent, size: 18,),
                                                          Icon(Icons.star, color: Colors.amberAccent, size: 18,),
                                                          Icon(Icons.star, color: Colors.amberAccent, size: 18,),
                                                          Icon(Icons.star, color: Colors.amberAccent, size: 18,),
                                                          Icon(Icons.star, color: Colors.black26, size: 18,),
                                                        ],
                                                      ),

                                                      SizedBox(height: 5,),

                                                      Row(
                                                        children: [
                                                          Icon(Icons.emoji_emotions, size: 15,  color: Colors.green, ),
                                                          SizedBox(width: 5,),
                                                          Text('0954 Reviews', style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                                                        ],
                                                      )


                                                    ],
                                                  ),
                                                ),


                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Image.asset('assets/pr1.png'),
                                                      Text('Simon Elizabeth', style: TextStyle(fontSize: 12, color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                                                    ],
                                                  ),
                                                )

                                              ],
                                            )


                                          ],
                                        ),
                                      ),
                                    ),



                                    ///Image Avatar
                                    Container(
                                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      width: 200,
                                      height: 200,
                                      child: Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Center(
                                          child: Container(
                                            child: Image.asset('assets/ser1.png'), /// replace your image with the Icon
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ),



                    ],
                  ),
                )



              ],
            ),

        ),
      ),

    );
  }
}


class Services_Details_Controller extends GetxController {


  final RxString sh_fullname = 'User'.obs;

  // The controller for the ListView
  late ScrollController controller11;


  var serviceId = 0.obs;

  @override
  void onInit() {
    super.onInit();

    controller11 = ScrollController();

    //print('details  onit' + serviceId.value.toString());
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
    //do_get_service_details();
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
          /*Get.snackbar(
            '','',
            titleText: Text('Success'),
            messageText: Text(historyData['message'],),
            duration: Duration(seconds: 2),
            snackPosition:SnackPosition.TOP,
            backgroundColor: Colors.green,
          );*/


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

