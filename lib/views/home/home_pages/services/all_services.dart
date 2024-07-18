import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:nextdoor/views/home/home_pages/services/service_info/service_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../controllers/home_controller.dart';

class All_Services extends StatelessWidget {

  All_Services({super.key});
  final All_Services_Controller controller = Get.put(All_Services_Controller());



  final Color kDarkBlueColor = Color(0xFF2873BA);

 // final Home_Controller home_controller = Get.put(Home_Controller());


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var smalltextWhite = const TextStyle( color: Colors.white, fontWeight: FontWeight.w500, fontSize: 11, fontFamily: 'Montseract Medium', );
    var formatter = NumberFormat('#,###,000');


    return Scaffold(
      backgroundColor: Color(0xFFFDFFFF),

      body: RefreshIndicator(
        onRefresh: controller._reload,
        child: Obx(()=>
        controller._isFirstLoadRunning.value
            ? Container(
                margin: const EdgeInsets.all(10),
                width: size.width,
                height: 300,
                child: Shimmer.fromColors(
                  baseColor: Colors.black12,
                  highlightColor: Colors.white10,
                  child: ListView.builder (
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    scrollDirection: Axis.vertical,
                    itemCount: 4,
                    itemBuilder: (_, __) => Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 250.0,
                            height: 250.0,
                            color: Colors.white,
                          ),
                          SizedBox(width: 20,),

                          //SizedBox(height: 5,),
                        ],
                      ),
                    ),

                  ),
                ),
              )
            : controller._isNetwork.isFalse
              ? Center(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                      child: Column(
                        children: [
                          const Icon(Icons.signal_wifi_connected_no_internet_4, size: 40,),
                          const SizedBox(height: 20,),
                          const Text('No Internet Connection', style: TextStyle(color: Colors.black),),
                          const SizedBox(height: 10,),
                          const Text('Please check your internet connection and try again.', style: TextStyle(fontSize: 12, color: Colors.black54),),

                          const SizedBox(height: 20,),
                          TextButton(
                            onPressed: (){

                                  controller._isFirstLoadRunning.value = true;
                                  controller._page.value = 1;
                                  controller.do_get_services();
                                  controller._isNetwork.value = true;

                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(const Color(0xffe3bfbf))
                            ),
                            child: const Text( "Try again",   style: TextStyle(  color: Color(0xffc11818),  fontWeight: FontWeight.w300, fontSize: 12),  ),
                          ),

                        ],
                      ),
                    ),
                  )
              : Column(
                children: [
                  Expanded(
                    child: controller._isEmpty.isTrue
                      ? const Center(child: Text('Oops! This list is empty! 😔', style: TextStyle(color: Color(0xff3e4095)),),)
                      : Container(
                                      //height: size.height * 0.9,
                                      child: ListView.builder(
                    controller: controller.controller11,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller._HistoryData.value.length,
                    itemBuilder: (context, index) => InkWell(
                      highlightColor: Colors.white,
                      focusColor: Colors.white,
                      hoverColor: Colors.white,
                      splashColor: Colors.white,
                      onTap:((){
                        Get.to(() => Services_Details(2));
                      }),
                      child: Card(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 35),
                        //color: Color(0xff1e3046)
                        //color: Colors.white,
                        //color: Colors.white,
                        //margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        //elevation: 1,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          //width: 300,
                          //color: Colors.white,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Stack(children: [
                                //image
                                Container(
                                  height: 150,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                   // color: Color(0xFFC30010),
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => Image.asset('assets/loading.gif'),
                                    imageUrl: 'https://gnexdor.com/admin/assets/images/service_images/' + controller._HistoryData[index]['image'],
                                  ),
                                ),

                               /* Container(
                                    //alignment: Alignment.center,
                                  padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFC30010),
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),

                                    child: Text( 'Pending', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200,  fontFamily: 'ProximaNovaRegular',  fontSize: 12), )
                                ),*/

                              ],),



                              SizedBox(height: 20,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(controller._HistoryData.value[index]['title'], style: TextStyle(fontSize: 18,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                                      Text('By ' + controller._HistoryData.value[index]['provider_name'], style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),),
                                    ],
                                  ),

                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.access_time_outlined, size: 15, color: Colors.black54,),
                                        SizedBox(width: 5,),
                                        Text(controller._HistoryData.value[index]['duration'] + ' ' + controller._HistoryData.value[index]['duration_measure'], style: TextStyle(fontSize: 14,  color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),),

                                      ],
                                    ),
                                  )
                                ],
                              ),


                              SizedBox(height: 20,),

                              Container(
                                child: Row(
                                  children: [
                                    //Text("₦" + controller._HistoryData.value[index]['price'], style: TextStyle(fontSize: 22,  color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                                    Text('₦ ${formatter.format(int.parse(controller._HistoryData.value[index]['price'].toString()))}', style: TextStyle(fontSize: 22,  color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,)),

                                    SizedBox(width: 10,),
                                    Text(controller._HistoryData.value[index]['discount'] + '% off', style: TextStyle(fontSize: 12,  color: Colors.green, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),),

                                  ],
                                ),
                              ),


                            ],
                          ),
                        ),


                      ),
                    ),
                                      ),
                                    ),
                  ),

                  // when the _loadMore function is running
                  if (controller._isLoadMoreRunning == true)
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Center(
                        child: CircularProgressIndicator(color: Color(0xff3e4095),),
                      ),
                    ),

                  // When nothing else to load
                  if (controller._hasNextPage == false)
                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      color: const Color(0xff3e4095),
                      child: const Center(
                        child: Text('Oops! This is all we have! 😊', style: TextStyle(color: Colors.white),),
                      ),
                    ),
                ],
              ),
        ),
      ),

    );
  }
}




class All_Services_Controller extends GetxController {


  final RxString sh_fullname = 'User'.obs;

  // The controller for the ListView
  late ScrollController controller11;

  @override
  void onInit() {
    super.onInit();

    //controller11 = ScrollController();

    do_get_services();
    controller11 = ScrollController()..addListener(_loadMore);

  }

  @override
  void dispose() {
    controller11.removeListener(_loadMore);
    super.dispose();
  }


  @override
  void onReady() {
    super.onReady();

  }



  // At the beginning, we fetch the first 20 posts
  final _page = 1.obs;

  // you can change this value to fetch more or less posts per page (10, 15, 5, etc)
  final _limit = 3.obs;

  // There is next page or not
  RxBool _hasNextPage = true.obs;

  // Used to display loading indicators when _firstLoad function is running
  RxBool _isFirstLoadRunning = false.obs;

  // Used to display loading indicators when _loadMore function is running
  RxBool _isLoadMoreRunning = false.obs;



  //RxBool _isLoading = true.obs;
  RxBool _isNetwork = true.obs;
  RxBool _isEmpty = false.obs;
  RxList _HistoryData = [].obs;

  Future<void> do_get_services() async {

    _isFirstLoadRunning.value = true;

    await Future.delayed(const Duration(seconds: 3));

    var urlPrefix = 'https://portal.gnexdor.com/api/mobile/v1/Api.php?apicall=getAllServices';

    try
    {
      var map = new Map<String, dynamic>();
      map['_page'] = _page.value.toString();  //must be a string
      map['_limit'] = _limit.value.toString();  //must be a string
      map['Authorization_code'] ="eyJpZCI6NTQsImV4cCI6MTcxNTU5Njc0NiwiaWF0IjoxNzE1NTkzMTQ2fQ";

      final response = await http.post(
        Uri.parse(urlPrefix),
        body: map,
      );

      //final http.Response response = await http.get(Uri.parse(url));

      if(response.statusCode == 200)
      {

        _isFirstLoadRunning.value = false;
        _isNetwork.value = true;
        _isEmpty.value = false;
        _isFirstLoadRunning.value = false;


        final historyData = json.decode(response.body);

        print(historyData);
        //print(historyData['status']);
        //print(historyData['message']);

          //check length
        if(historyData['user_data'].length == 0)
        {
          _isFirstLoadRunning.value = false;
          _isNetwork.value = true;
          _isEmpty.value = true;
          _isFirstLoadRunning.value = false;

          Get.snackbar(
            '','',
            titleText: Text('Warning', style: TextStyle(color: Colors.white),),
            messageText: Text('Empty Data', style: TextStyle(color: Colors.white),),
            duration: Duration(seconds: 2),
            snackPosition:SnackPosition.TOP,
            backgroundColor: Colors.red,
          );
        }
        else{
          print(historyData['user_data']);


          _isFirstLoadRunning.value = false;
          _isNetwork.value = true;
          _isEmpty.value = false;
          _isFirstLoadRunning.value = false;

          _HistoryData.value = historyData['user_data'].toList();


        }




      }
      else
      {

        _isFirstLoadRunning.value = false;
        _isNetwork.value = false;
        _isEmpty.value = false;
        _isFirstLoadRunning.value = false;


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

      _isFirstLoadRunning.value = false;
      _isNetwork.value = false;
      _isEmpty.value = false;
      _isFirstLoadRunning.value = false;


      // Get.back();
      Get.snackbar(
        '','',
        titleText: Text('Network Error excep 1', style: TextStyle(color: Colors.white),),
        messageText: Text('Please kindly check your network connection.!', style: TextStyle(color: Colors.white),),
        duration: Duration(seconds: 2),
        snackPosition:SnackPosition.TOP,
        backgroundColor: Colors.red,
      );


      // Only catches an exception of type `Exception`.
    }catch (e)
    {
       print(e); // Catches all types of `Exception` and `Error`.

      _isFirstLoadRunning.value = false;
      _isNetwork.value = false;
      _isEmpty.value = false;
      _isFirstLoadRunning.value = false;


      Get.snackbar(
        '','',
        titleText: Text('Network Error excep 2', style: TextStyle(color: Colors.white),),
        messageText: Text('Please kindly check your network connection.!', style: TextStyle(color: Colors.white),),
        duration: Duration(seconds: 2),
        snackPosition:SnackPosition.TOP,
        backgroundColor: Colors.red,
      );


    }



  }


  List _HistoryData_more = [].obs;
  void _loadMore() async {

    if (_hasNextPage.value == true &&  _isFirstLoadRunning.value == false &&  _isLoadMoreRunning.value == false && controller11.position.extentAfter < 500)
    {

      _isLoadMoreRunning.value = true; // Display a progress indicator at the bottom


      _page.value += 1;  // Increase _page by 1

      try
      {
        var url = 'https://portal.gnexdor.com/api/mobile/v1/Api.php?apicall=getAllServices';
        var map = new Map<String, dynamic>();
        map['_page'] = _page.value.toString();
        map['_limit'] = _limit.value.toString();
        map['Authorization_code'] ="eyJpZCI6NTQsImV4cCI6MTcxNTU5Njc0NiwiaWF0IjoxNzE1NTkzMTQ2fQ";

        final response = await http.post(
          Uri.parse(url),
          body: map,
        );


        if (response.statusCode == 200) {
          final historyData = json.decode(response.body);

          //print(historyData['user_data']);

          if (historyData['user_data'].length != 0) {
            _HistoryData_more = historyData['user_data'].toList();


            _HistoryData.value.addAll(_HistoryData_more);

          }
          else {
            //print('empty data');

              _hasNextPage.value = false;

          }
        }
        else {


            _isFirstLoadRunning.value = false;
            //_isLoading = false;
            _isEmpty.value = true;
            _isNetwork.value = false;


          //ElegantNotification.error(  title:  Text("Error"), description:  Text("Error during connecting to server.")).show(context);


        }


          _isLoadMoreRunning.value = false;

      }
      on Exception {


          _isLoadMoreRunning.value = false;
          _isFirstLoadRunning.value = false;
          //_isLoading = false;
          _isEmpty.value = true;
          _isNetwork.value = false;




        // Only catches an exception of type `Exception`.
      }catch (e) {
        print(e); // Catches all types of `Exception` and `Error`.


          _isLoadMoreRunning.value = false;
          _isFirstLoadRunning.value = false;
          //_isLoading = false;
          _isEmpty.value = true;
          _isNetwork.value = false;

      }
    }
  }



  Future<void> _reload() async {

    _isFirstLoadRunning.value = true;
    _page.value = 1;
    _isNetwork.value = true;
    _hasNextPage = true.obs;


    do_get_services();

  }








}

