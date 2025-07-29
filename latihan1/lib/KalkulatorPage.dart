import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_page.dart';
import 'register_page.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  TextEditingController Angka1Cotroller = TextEditingController();
  TextEditingController Angka2Controller = TextEditingController();

  String hasilPerhitungan = "0";

  void Hitung(String operator) {
    try {
      double angka1 = double.parse(Angka1Cotroller.text.trim());
      double angka2 = double.parse(Angka2Controller.text.trim());

      double hasil;

      switch (operator) {
        case '+':
          hasil = angka1 + angka2;
          break;
        case '-':
          hasil = angka1 - angka2;
          break;
        case '*':
          hasil = angka1 * angka2;
          break;
        case '/':
          hasil = angka1 / angka2;
          if (angka2 == 0) {
            setState(() {
              hasilPerhitungan = "Tidak bisa dibagi 0";
            });
            return;
          }
          break;
        default:
          setState(() {
            hasilPerhitungan = "error hasil";
          });
          return;
      }
      setState(() {
        hasilPerhitungan = hasil.toString();
      });
    } catch (e) {
      setState(() {
        hasilPerhitungan = "input tidak valid";
      });
    }
  }

  void Reset() {
    Angka1Cotroller.clear();
    Angka2Controller.clear();
    hasilPerhitungan = "0";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: Center(
          child: Text("Kalkulator")),
        foregroundColor: Colors.amber,
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                style: TextStyle(
                  color: Colors.amber
                ),
                controller: Angka1Cotroller,
                decoration: InputDecoration(
                  labelText: "Angka1",
                  labelStyle: TextStyle(
                    color: Colors.amber
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange
                    )
                  ),
                  
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                style: TextStyle(
                  color: Colors.amber
                ),
                controller: Angka2Controller,
                decoration: InputDecoration(
                  labelText: "Angka2",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange
                    )
                  ),
                  labelStyle: TextStyle(color: Colors.amber),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: ElevatedButton(
                      onPressed: () => Hitung("+"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                      ),
                      child: Text("+"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: ElevatedButton(
                      onPressed: () => Hitung("-"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                      ),
                      child: Text("-"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: ElevatedButton(
                      onPressed: () => Hitung("*"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                      ),
                      child: Text("x"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: ElevatedButton(
                      onPressed: () => Hitung("/"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                      ),
                      child: Text(":"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                hasilPerhitungan, 
                style: TextStyle(color: Colors.amber)
                ),
            ),
            ElevatedButton(
            onPressed: () => Reset(), 
            child: Text("Reset"), 
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black
            ),),
          ],
        ),
      ),
    );
  }
}
