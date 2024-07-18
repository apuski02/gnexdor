import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextdoor/views/home/home_pages/services/Ongoing.dart';
import 'package:nextdoor/views/home/home_pages/services/Pending.dart';
import 'package:nextdoor/views/home/home_pages/services/all_services.dart';
import 'package:nextdoor/views/home/home_pages/services/completed.dart';
//import '../screens/profile_icon.dart';

class Service extends StatelessWidget {

  Service({super.key});

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
            title: Text('Services', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'Nato'),),

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
                Tab(text: "All",),
                Tab( text: "Ongoing"),
                Tab( text: "Pending"),
                Tab( text: "Completed"),

              ],

            ),
          ),


          body: TabBarView(
            children: [
              All_Services(),
              Ongoing(),
              Pending(),
              Completed(),
            ],
          ),
        ),
      ),
    );
  }
}
