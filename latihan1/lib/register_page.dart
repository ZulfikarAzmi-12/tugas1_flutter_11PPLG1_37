import 'package:flutter/material.dart';
import 'package:latihan1/widget/button.dart';
import 'package:latihan1/widget/textfield.dart';
import 'KalkulatorPage.dart';

enum JenisKelamin { Pria, Wanita }

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _tanggallahirController = TextEditingController();

  JenisKelamin? _jenisKelamin;
  DateTime? _tanggallahir;

  @override
  void dispose() {
    _tanggallahirController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text("Register")),
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.amber,
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Complete the input", style: TextStyle(color: Colors.amber)),
            Container(
              margin: EdgeInsets.all(10),
              child: CustomTextField(
                controller: _usernameController,
                labeltext: "Input username",
                obscureText: false,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: CustomTextField(
                controller: _passwordController,
                labeltext: "Input password",
                obscureText: true,
              ),
            ),

            RadioListTile<JenisKelamin>(
              title: Text("Pria", style: TextStyle(color: Colors.amber)),
              value: JenisKelamin.Pria,
              groupValue: _jenisKelamin,
              onChanged: (JenisKelamin? value) {
                setState(() {
                  _jenisKelamin = value;
                });
              },
            ),
            RadioListTile<JenisKelamin>(
              title: Text("Wanita", style: TextStyle(color: Colors.amber)),
              value: JenisKelamin.Wanita,
              groupValue: _jenisKelamin,
              onChanged: (JenisKelamin? value) {
                setState(() {
                  _jenisKelamin = value;
                });
              },
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: _tanggallahirController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Tanggal lahir",
                  hintText: "pilih tanggal lahir",
                  labelStyle: TextStyle(color: Colors.amber),
                  hintStyle: TextStyle(color: Colors.amber),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _tanggallahir ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.dark().copyWith(
                          colorScheme: ColorScheme.dark(
                            primary: Colors.amber,
                            onPrimary: Colors.black,
                            surface: Colors.black,
                            onSurface: Colors.amber,
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.amber,
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (picked != null) {
                    setState(() {
                      _tanggallahir = picked;
                      _tanggallahirController.text =
                          "${picked.day}/${picked.month}/${picked.year}";
                    });
                  }
                },
              ),
            ),
            Center(
              child: Button(
                text: "Register",
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;

                  if (username.isEmpty &&
                      password.isEmpty &&
                      _jenisKelamin == null &&
                      _tanggallahir == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Lengkapi semua isian!"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => KalkulatorPage()),
                    );
                  }
                },
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
