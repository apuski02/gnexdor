//import 'package:exclusivetravel/views/home/pages/home_pages/flights/flight_details/flight_details.dart';
//import 'package:exclusivetravel/views/home/pages/screens/profile_icon.dart';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nextdoor/views/home/home_pages/services/service_info/service_details.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
import '../../../controllers/home_controller.dart';
import '../categories/categories.dart';
import 'notifications.dart';

//import 'flights/flight_details/flight_search_results.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Color kDarkBlueColor = Color(0xFF2873BA);

  final Home_Screen_controller home_screen_controller = Get.put(Home_Screen_controller());




  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var formatter = NumberFormat('#,###,000');

    return  Scaffold(
      backgroundColor: Color(0xFFFDFFFF),

      /*appBar: AppBar(

        title: Text('Next Door', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w400, fontFamily: 'ProximaNovaRegular'),),

        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading:false,
        scrolledUnderElevation: 0,
        *//*leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
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
        ],*//*

      ),*/

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 25,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 54,
                        width: 54,
                        child: Image.asset('assets/profile.png'),
                      ),

                      SizedBox(width: 10,),

                      Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Welcome, ', style: TextStyle(fontSize: 20,  color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),),
                              Text(home_screen_controller.sh_fullname.value, style: TextStyle(fontSize: 20,  color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                            ],
                          ),
                        ),

                    ],
                  ),


                  Container(
                    child: IconButton(onPressed:(){Get.to(() => Notifications());}, icon: Icon(Icons.notifications, size: 30, color: Color(0xFF2B70B8),) ),
                  )

                ],
              ),


              SizedBox(height: 40,),

             // Obx(()=>Text(home_controller.sh_fullname.value, style: TextStyle(fontSize: 20,  color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),)),


              //search
              TextField(
                //controller: searchText,
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

                  hintText: 'Find services near you ',
                  hintStyle: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w200,),
                  prefixIcon: Icon(Icons.search, size: 20, color: Colors.black),
                ),

                autocorrect: false,
                textInputAction: TextInputAction.next,
              ),




              SizedBox(height: 30,),

              //caegotires
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular Categories', style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                  
                  GestureDetector( onTap:(){ Get.to(() => Categories());  },  child: Text('See More', style: TextStyle(fontSize: 14, color: Colors.black45, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w400,),)),
                
                ],
              ),

              SizedBox(height: 20,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      width: 110,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1),// changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 5, height: 30, child: DecoratedBox( decoration: BoxDecoration(  color: Color(0xFF8E242B)  ), ),),
                          SizedBox(width: 10,),
                          Text('Plumbing', style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w400,),),
                        ],
                      ),
                    ),

                    SizedBox(width: 10,),

                    Container(
                      width: 105,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 5, height: 30, child: DecoratedBox( decoration: BoxDecoration(  color: Color(0xFF60BDF1)  ), ),),
                          SizedBox(width: 10,),
                          Text('Electrical', style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w400,),),
                        ],
                      ),
                    ),

                    SizedBox(width: 10,),

                    Container(
                      width: 105,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 5, height: 30, child: DecoratedBox( decoration: BoxDecoration(  color: Color(0xFFACA45A)  ), ),),
                          SizedBox(width: 10,),
                          Text('Baking', style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w400,),),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      width: 110,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1),// changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 5, height: 30, child: DecoratedBox( decoration: BoxDecoration(  color: Color(0xFF4CE16D)  ), ),),
                          SizedBox(width: 10,),
                          Text('Decore', style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w400,),),
                        ],
                      ),
                    ),

                    SizedBox(width: 10,),

                    Container(
                      width: 105,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 5, height: 30, child: DecoratedBox( decoration: BoxDecoration(  color: Color(0xFF30BEB6)  ), ),),
                          SizedBox(width: 10,),
                          Text('Painting', style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w400,),),
                        ],
                      ),
                    ),

                    SizedBox(width: 10,),

                    Container(
                      width: 105,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 5, height: 30, child: DecoratedBox( decoration: BoxDecoration(  color: Color(0xFF000000)  ), ),),
                          SizedBox(width: 10,),
                          Text('Repairs', style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w400,),),
                        ],
                      ),
                    ),

                  ],
                ),
              ),




              SizedBox(height: 40,),


              Text('Recent Services ', style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(20),
                //height: 120,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      child: Column(
                        children: [
                          Text('0', style: TextStyle(fontSize: 35, color: Color(0xFFF2C464), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                          SizedBox(height: 10,),
                          Text('Ongoing', style: TextStyle(fontSize: 18, height: 1, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w300,),),
                        ],
                      ),
                    ),

                    SizedBox(width: 10,),

                    Container(
                      //width: 100,
                      //height: 100,
                     // child: Image.asset('assets/grap.png'),
                      child:  CircularPercentIndicator(
                        radius: 60.0,
                        lineWidth: 13.0,
                        animation: true,
                        percent: 0,
                        center: Text( "0.0%",   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0), ),
                        //footer: new Text(  "Sales this week",  style:   new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0), ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: kDarkBlueColor,
                      ),
                    ),

                    SizedBox(width: 10,),

                    Container(
                    child: Column(
                      children: [
                        Text('0', style: TextStyle(fontSize: 28, color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                        SizedBox(height: 10,),
                        Text('Requests ', style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w300,),),
                      ],
                    ),
                  ),

                ],),
              ),


              SizedBox(height: 50,),

              //completed services
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Common Services ', style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                  Text('See More', style: TextStyle(fontSize: 14, color: Colors.black45, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w400,),),
                ],
              ),


              /*Container(
                height: 290,
                width: 350,
                //color: Color(0xffE0E0E0),
                child: Stack(children: <Widget>[
                  Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 150 / 2.0, ),  ///here we create space for the circle avatar to get ut of the box
                        child: Container(
                          padding: EdgeInsets.all(15),
                          height: 300.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8.0,
                                offset: Offset(0.0, 5.0),
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

                                        Text('Painting Single Room', style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                                        SizedBox(height: 7,),

                                        Row(
                                          children: [
                                            Text('Ratings: ', style: TextStyle(fontSize: 18, color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

                                            SizedBox(width: 5,),

                                            Icon(Icons.star, color: Colors.amberAccent,),
                                            Icon(Icons.star, color: Colors.amberAccent,),
                                            Icon(Icons.star, color: Colors.amberAccent,),
                                            Icon(Icons.star, color: Colors.amberAccent,),
                                            Icon(Icons.star, color: Colors.black26,),
                                          ],
                                        ),

                                        SizedBox(height: 7,),

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
              ),*/


              //SizedBox(height: 50,),


              //common services
              Obx(()
               =>  home_screen_controller._loadingCommonService.isTrue
                ? Container(
                  margin: const EdgeInsets.all(10),
                  width: size.width,
                  height: 300,
                  child: Shimmer.fromColors(
                    baseColor: Colors.black12,
                    highlightColor: Colors.white10,
                    child: ListView.builder (
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      scrollDirection: Axis.horizontal,
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
                : home_screen_controller._isNetwork.isFalse
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
                            /*setState(() {
                              _isFirstLoadRunning = true;
                              _page=1;
                              _firstLoad();
                              _isNetwork = true;
                            });*/
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
                    : home_screen_controller._isEmptyCommonServices.isTrue
                        ? const Center(child: Text('Oops! This list is empty! 😔', style: TextStyle(color: Color(0xff3e4095)),),)
                        : Container(
                              height: 300,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: home_screen_controller._HistoryData.length,
                                itemBuilder: (context, index) => InkWell(
                                    highlightColor: Colors.white,
                                    focusColor: Colors.white,
                                    hoverColor: Colors.white,
                                    splashColor: Colors.white,
                                    onTap:((){
                                      Get.to(() => Services_Details(12));
                                    }),
                                    child: Container(
                                      height: 220,
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
                                                height: 310.0,
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

                                                              Text(home_screen_controller._HistoryData[index]['title'], style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                                                              Text('₦ ${formatter.format(int.parse(home_screen_controller._HistoryData[index]['price'].toString()))}', style: TextStyle(fontSize: 18, color: Colors.black54, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),


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
                                                              Text(home_screen_controller._HistoryData[index]['provider_name'], style: TextStyle(fontSize: 12, color: Color(0xFF2B70B8), fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),

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
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(20.0),
                                                      child: CachedNetworkImage(
                                                        placeholder: (context, url) => Image.asset('assets/loading.gif'),
                                                        imageUrl: 'https://gnexdor.com/admin/assets/images/service_images/' + home_screen_controller._HistoryData[index]['image'],
                                                      ),
                                                    ),

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
              ),



              SizedBox(height: 30,),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Refer ', style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                  //Text('See More', style: TextStyle(fontSize: 14, color: Colors.black45, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w400,),),
                ],
              ),

              SizedBox(height: 10,),


              //refer
              Container(
                height: 210,
                width:  MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/refer.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Refer And Earn ', style: TextStyle(fontSize: 35, color: Colors.white, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
                    SizedBox(height: 20,),
                    Text('Refer a friend or family member to Gnexdoor and receive amazing gifts and bonuses. ', style: TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.w300,),),
    
                    SizedBox(height: 20,),
    
                    Row(
                      children: [
                        Text('Learn More ', style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'ProximaNovaRegular', fontWeight: FontWeight.bold,),),
    
                        SizedBox(width: 7,),
    
                        Icon(Icons.arrow_forward_outlined, color: Color(0xFF2B70B8),),
                      ],
                    )
    
                  ],
                ) /* add child content here */,
              ),

            ],
          ),
        ),
      ),
    );
  }
}






class Home_Screen_controller extends GetxController{


  final RxString sh_fullname = 'User'.obs;


  @override
  void onInit() {
    get_stored_data();

    get_common_services();
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


  //get_profile_info



  //get common services
  RxBool _loadingCommonService= true.obs;
  RxBool _isNetwork = true.obs;
  RxBool _isEmptyCommonServices = false.obs;
  RxList _HistoryData = [].obs;

  Future<void> get_common_services() async {


    await Future.delayed(const Duration(seconds: 3));

    var urlPrefix = 'https://portal.gnexdor.com/api/mobile/v1/Api.php?apicall=getCommonServices';

    final prefs = await SharedPreferences.getInstance();
    var user_id = prefs.getString('nextdoor_id');

    try
    {
      var map = new Map<String, dynamic>();
      //map['start_page'] = '1';
      //map['per_page'] = '10';
      //map['user_id'] = user_id;
      //map['type'] = 'Published';
      map['Authorization_code'] ="eyJpZCI6NTQsImV4cCI6MTcxNTU5Njc0NiwiaWF0IjoxNzE1NTkzMTQ2fQ";

      final response = await http.post(
        Uri.parse(urlPrefix),
        body: map,
      );

      //final http.Response response = await http.get(Uri.parse(url));

      if(response.statusCode == 200)
      {

        _loadingCommonService.value = false;
        _isNetwork.value = true;
        _isEmptyCommonServices.value = false;


        final historyData = json.decode(response.body);

        //if(historyData['user_data'].length != 0)

          //good reg

          print(historyData);
          print(historyData['user_data'].length);

          if(historyData['user_data'].length == 0)
          {
            _loadingCommonService.value = false;
            _isNetwork.value = true;
            _isEmptyCommonServices.value = true;

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

            _loadingCommonService.value = false;
            _isNetwork.value = true;
            _isEmptyCommonServices.value = false;

            _HistoryData.value = historyData['user_data'].toList();

          }






      }
      else
      {

        print('no working' + response.statusCode.toString());

        _loadingCommonService.value = false;
        _isNetwork.value = false;
        _isEmptyCommonServices.value = false;

        //Get.back();

        Get.snackbar(
          '','',
          titleText: Text('Network Error', style: TextStyle(color: Colors.white),),
          messageText: Text('Please kindly check your network connection.!', style: TextStyle(color: Colors.white),),
          duration: Duration(seconds: 2),
          snackPosition:SnackPosition.TOP,
          backgroundColor: Colors.red,
        );


      }

    }on Exception {
      print('exception error'); //

      _loadingCommonService.value = false;
      _isNetwork.value = false;
      _isEmptyCommonServices.value = false;

      // Get.back();
      Get.snackbar(
        '','',
        titleText: Text('Network Error excep ee', style: TextStyle(color: Colors.white),),
        messageText: Text('Please kindly check your network connection.!', style: TextStyle(color: Colors.white),),
        duration: Duration(seconds: 2),
        snackPosition:SnackPosition.TOP,
        backgroundColor: Colors.red,
      );



      // Only catches an exception of type `Exception`.
    }catch (e) {
      print(e); // Catches all types of `Exception` and `Error`.

      _loadingCommonService.value = false;
      _isNetwork.value = false;
      _isEmptyCommonServices.value = false;

      // Get.back();
      Get.snackbar(
        '','',
        titleText: Text('Network Error ee2', style: TextStyle(color: Colors.white),),
        messageText: Text('Please kindly check your network connection.!', style: TextStyle(color: Colors.white),),
        duration: Duration(seconds: 2),
        snackPosition:SnackPosition.TOP,
        backgroundColor: Colors.red,
      );


    }



  }



}