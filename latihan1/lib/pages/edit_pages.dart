import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/controllers_editpage.dart';
import 'package:latihan1/widget/button.dart';
import 'package:latihan1/widget/textfield.dart';

class FootballEditPage extends StatelessWidget {
  FootballEditPage({super.key});

  final FootballEditController footballEditController = Get.put(FootballEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pemain")),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: CustomTextField(
              controller: footballEditController.imageController,
              labeltext: "ImageUrl",
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: CustomTextField(
              controller: footballEditController.namaController,
              labeltext: "Nama Pemain",
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: CustomTextField(
              controller: footballEditController.posisiController,
              labeltext: "Posisi",
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: CustomTextField(
              controller: footballEditController.nomorController,
              keyboardType: const TextInputType.numberWithOptions(),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              labeltext: "Nomor Punggung",
            ),
          ),
          Button(
            text: "Save",
            onPressed: () {
              footballEditController.savePlayer();
              Get.back(); 
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
