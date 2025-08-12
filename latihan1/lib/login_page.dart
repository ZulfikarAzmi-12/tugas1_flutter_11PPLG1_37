import 'package:flutter/material.dart';
import 'package:latihan1/widget/button.dart';
import 'package:latihan1/widget/textfield.dart';
import 'KalkulatorPage.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to our first app",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Please login using your email"),
            //image resource
            Center(
              child: Image.asset(
                'Asset/image/logo.png',
                width: 200,
                height: 200,
              ),
            ),
            //isian username dan password
            Container(
              margin: EdgeInsets.all(10),
              child: CustomTextField(
                controller: _usernameController,
                labeltext: "Input Username",
                obscureText: false,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: CustomTextField(
                controller: _passwordController,
                labeltext: "Input Password",
                obscureText: true,
              ),
            ),
            Center(
              child: Button(
                text: "Login",
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;

                  if (username == 'admin' && password == '123') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Login Sukses"),
                        backgroundColor: Colors.blue,
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => KalkulatorPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Username atau password salah"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text("register"),
              ),
            ),
            //style : hint , hidden char for password
            //button login, style bebas
          ],
        ),
      ),
    );
  }
}
