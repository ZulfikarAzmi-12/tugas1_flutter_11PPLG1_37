import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/controllers_editpage.dart';
import 'package:latihan1/controllers/controllers_football.dart';
import 'package:latihan1/models/football_models.dart';
import 'package:latihan1/widget/button.dart';
import 'package:latihan1/widget/textfield.dart';


class FootballEditPage extends StatelessWidget {

  FootballEditPage({super.key});


  final footballController = Get.find<FootballController>();

  


  final imageController =TextEditingController();
  final namaController = TextEditingController();
  final posisiController = TextEditingController();
  final nomorController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map;
    final int index = arguments["index"];
    final Players player = arguments["player"];

    imageController.text = player.imageUrl;
    namaController.text = player.nama;
    posisiController.text = player.posisi;
    nomorController.text = player.nomorpunggung.toString();
    return Scaffold(
      appBar: AppBar(title: Text("Pemain"),),
      body: Container(
        child: 
        Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: CustomTextField(
                controller: imageController,
                labeltext: "ImageUrl"
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: CustomTextField(
                controller: namaController,
                labeltext: "Nama Pemain"
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: CustomTextField(
                controller: posisiController, 
                labeltext: "Posisi"
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: CustomTextField(
              controller: nomorController,
              keyboardType: TextInputType.numberWithOptions(),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              labeltext: "Nomor Punggung"),
              
            ),
            Button(
              text: "Save",
              onPressed: () {
                final updatedPlayer = Players(
                imageUrl: imageController.text,
                nama: namaController.text,
                posisi: posisiController.text,
                nomorpunggung: int.parse(nomorController.text),
                );

                footballController.editPlayer(index,updatedPlayer);

                ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Data berhasil di simpan"),
                        backgroundColor: Colors.green,
                      ),
                    );
              Get.back(); // kembali ke list
              }, 
              backgroundColor: Colors.blue, 
              foregroundColor: Colors.white

              
            )
          ],
        ),
      )
    );
  }
}