import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:latihan1/pages/edit_pages.dart';
import 'package:latihan1/pages/football_pages.dart';
import 'package:latihan1/pages/kalkulator_pages.dart';
import 'package:latihan1/pages/main_pages.dart';
import 'package:latihan1/pages/profile_pages.dart';
import 'package:latihan1/routes/routes.dart';

class AppPages {
  static final pages =[
    GetPage(name: AppRoutes.main, page: () => MainPages(),),
    GetPage(name: AppRoutes.profile, page: () => ProfilePages(),),
    GetPage(name: AppRoutes.kalkulator, page: () => KalkukatorPages(),),
    GetPage(name: AppRoutes.footballPlayers, page: () => FootballPages(),),
    GetPage(name: AppRoutes.editPage, page: () => FootballEditPage(),)
    
  ];
}