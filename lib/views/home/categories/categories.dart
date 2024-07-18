import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nextdoor/views/home/categories/categories_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Categories extends StatelessWidget {

  Categories({super.key});
  final Category_Controller controller = Get.put(Category_Controller());



  final Color kDarkBlueColor = Color(0xFF2873BA);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFFFF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFDFFFF),
        title: Text('Categories', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'Nato'),),
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: true,


      ),

      body: Obx(()=> Column(
          children: [
            //Text('categories list'),
            controller._isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Expanded(
              child:AlignedGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                itemCount: controller._HistoryData.value.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Get.to(Categories_List());
                    },
                    child: Container(
                      width: 100,
                      height: 150,
                      margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(20),
                      //color: Colors.greenAccent,
                      decoration: BoxDecoration(
                        //color: Color(0xFF2B70B8),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 0,
                            offset: Offset(0, 0),// changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                              height: 100,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Color(0xFFCADBED),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              ),
                              child: Icon(Icons.lightbulb_rounded, size: 60, color: Colors.black87,)
                          ),

                          Container(
                              height: 50,
                              width: 200,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                              ),
                              child: Text(controller._HistoryData.value[index]['name'].toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 18,  color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}




class Category_Controller extends GetxController {


  final RxString sh_fullname = 'User'.obs;


  @override
  void onInit() {
    super.onInit();

    print('page onit');
   // get_stored_data();
    do_get_categories();

  }


  @override
  void onReady() {
    super.onReady();

   // print('page ready');
    // perform database operation
   // do_get_categories();
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

  Future<void> do_get_categories() async {


    await Future.delayed(const Duration(seconds: 3));

    var urlPrefix = 'https://api.gnexdor.com/api/categories/';

    try
    {
      var map = new Map<String, dynamic>();
      map['start_page'] = '1';
      map['per_page'] = '10';
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
          //print(historyData['data']['full_name']);
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

