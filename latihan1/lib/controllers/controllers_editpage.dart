import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:latihan1/models/football_models.dart';

class FootballEditController extends GetxController {
  late TextEditingController namaController;
  late TextEditingController posisiController;
  late TextEditingController nomorController;

  void setPlayer(Players player) {
    namaController = TextEditingController(text: player.nama);
    posisiController = TextEditingController(text: player.posisi);
    nomorController = TextEditingController(text: player.nomorpunggung.toString()); 
  }
  

}