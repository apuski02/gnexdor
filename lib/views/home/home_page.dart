
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextdoor/views/home/home_pages/service.dart';

import '../../controllers/home_controller.dart';
import 'home_page.dart';
import 'home_pages/booking.dart';
import 'home_pages/home.dart';
import 'home_pages/profile.dart';

class Home_Page extends StatelessWidget {

  //final HomeController HomeController = Get.put(HomeController());
  final Home_Controller home_controller = Get.put(Home_Controller());



  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), // Dismiss the dialog and don't pop the screen
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true), // Dismiss the dialog and pop the screen
            child: Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop : false,
        onPopInvoked: (bool didPop){
          //print("back press $didPop");
          home_controller.do_logout();
        },
      child: Scaffold(
        backgroundColor: Color(0xFFFDFFFF),
        body: Obx(() => home_controller.screens2[home_controller.selectedScreenIndex.value]["screen"]),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
          backgroundColor: Colors.white,
          useLegacyColorScheme: false,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black26,
          selectedItemColor: Color(0xFF2B70B8),
          selectedLabelStyle: TextStyle(fontFamily: 'ProximaNovaRegular', fontSize: 12, fontWeight: FontWeight.bold),
          unselectedFontSize: 10,
          selectedFontSize: 10,
          currentIndex: home_controller.selectedScreenIndex.value,
          onTap: home_controller.selectScreen,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Color(0xFF2B70B8)),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_rounded), label: 'Booking', backgroundColor: Color(0xFF2B70B8)),
            BottomNavigationBarItem(icon: Icon(Icons.folder_rounded), label: 'Service', backgroundColor: Color(0xFF2B70B8)),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile", backgroundColor: Color(0xFF2B70B8)),
          ],
        )),
      ),
    );
  }
}

class HomeController extends GetxController {

  var selectedScreenIndex = 0.obs;
  List<Map<String, dynamic>> screens2 = [
    {"screen":  Home(), "title": "Home"},
    {"screen":  Booking(), "title": "Booking"},
    {"screen":  Service(), "title": "Service"},
    {"screen":  Profile(), "title": "Profile"},
  ];

  void selectScreen(int index) {
    selectedScreenIndex.value = index;
  }
}



