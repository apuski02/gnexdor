import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nextdoor/views/home/home_pages/booking/accepted.dart';
import 'package:nextdoor/views/home/home_pages/booking/cancelled.dart';
import 'package:nextdoor/views/home/home_pages/booking/declined.dart';
import 'package:nextdoor/views/home/home_pages/booking/request.dart';

class Booking extends StatelessWidget {

  Booking({super.key});


  final Color kDarkBlueColor = Color(0xFF2873BA);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            //toolbarHeight: 0,
            backgroundColor: Colors.white,
            centerTitle: false,
            title: Text('Booking', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'Nato'),),

            automaticallyImplyLeading: false,

            actions: [
              Icon(Icons.search)
            ],



            bottom:  TabBar(
              isScrollable: false,
              indicatorWeight: 2,

              labelColor : kDarkBlueColor,
              indicatorColor: kDarkBlueColor,
              overlayColor: MaterialStateProperty.all(Colors.white),
              labelStyle: TextStyle(fontFamily: 'Dosis', fontSize: 16, fontWeight: FontWeight.w400),
              labelPadding: EdgeInsets.all(2),
              //padding: EdgeInsets.all(0),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "Request",),
                Tab( text: "Accepted"),
                Tab( text: "Declined"),
                Tab( text: "Cancelled"),

              ],

            ),
          ),


          body: TabBarView(
            children: [
              Request_Booking(),
              Accepted_Booking(),
              Declined_Booking(),
              Cancelled_Booking(),
            ],
          ),
        ),
      ),
    );
  }
}
