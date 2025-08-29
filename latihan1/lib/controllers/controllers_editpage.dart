import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/controllers_football.dart';
import 'package:latihan1/models/football_models.dart';

class FootballEditController extends GetxController {
  late int index;
  late FootballController footballController;

  final imageController = TextEditingController();
  final namaController = TextEditingController();
  final posisiController = TextEditingController();
  final nomorController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    index = Get.arguments ['index'] as int;
    footballController = Get.find<FootballController>();
    
    final player = footballController.players[index];

    imageController.text = player.imageUrl;
    namaController.text = player.nama;
    posisiController.text = player.posisi;
    nomorController.text = player.nomorpunggung.toString();
  }

  void savePlayer() {
    final updatedPlayer = Players(
      imageUrl: imageController.text,
      nama: namaController.text,
      posisi: posisiController.text,
      nomorpunggung: int.tryParse(nomorController.text) ?? 0,
    );

    footballController.editPlayer(index, updatedPlayer);
  }
}
