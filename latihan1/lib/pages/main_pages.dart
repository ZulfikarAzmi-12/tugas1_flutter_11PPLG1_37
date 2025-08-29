import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:latihan1/pages/home_pages.dart';
import 'package:latihan1/pages/profile_pages.dart';
import 'football_pages.dart';
import 'kalkulator_pages.dart';
import 'package:latihan1/controllers/controllers_nav.dart';

class MainPages extends StatelessWidget {
  MainPages({super.key});

  final NavController  navController = Get.put(NavController());

  final List<Widget> pages =  [
    HomePages(),
    KalkukatorPages(),
    FootballPages(),
    ProfilePages()
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: pages[navController.currentIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navController.currentIndex.value,
        onTap: navController.changeIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem
          (icon: Icon(Icons.home,),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Kalkulator" 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "List Player"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile"
          )

        ]
      
      ),
    ),);

  }
}