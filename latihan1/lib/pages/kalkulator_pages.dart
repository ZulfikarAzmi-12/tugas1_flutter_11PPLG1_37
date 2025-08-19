import 'package:flutter/material.dart';
import 'package:latihan1/controllers/controllers_kalkulator.dart';
import 'package:latihan1/routes/routes.dart';
import 'package:latihan1/widget/button.dart';
import 'package:latihan1/widget/textfield.dart';
import 'package:get/get.dart';

class KalkukatorPages extends StatelessWidget {
  KalkukatorPages({super.key});

  final KalkulatorController kalkulatorController = Get.put(
    KalkulatorController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Kalkulator"))),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            CustomTextField(
              controller: kalkulatorController.txtAngka1,
              labeltext: "Input angka 1",
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: CustomTextField(
                controller: kalkulatorController.txtAngka2,
                labeltext: "Input Angka 2",
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Button(
                      text: "+",
                      onPressed: kalkulatorController.tambah,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                  ),
                  Button(
                    text: "-",
                    onPressed: kalkulatorController.kurang,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Button(
                    text: "X",
                    onPressed: kalkulatorController.kali,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                ),
                Button(
                  text: "/",
                  onPressed: kalkulatorController.bagi,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Obx(() {
                return Text(
                  style: TextStyle(fontSize: 20),
                  'Hasil : ' + kalkulatorController.hasil.value.toString(),
                );
              }),
            ),
            Center(
              child: Button(
                text: "Clear",
                onPressed: kalkulatorController.clear,
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
