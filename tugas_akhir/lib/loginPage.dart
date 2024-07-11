import 'package:flutter/material.dart';
import 'package:tugas_akhir/homePage.dart';
import 'package:tugas_akhir/registrationPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  String _loginUrl =
      'https://fakestoreapi.com/auth/login'; // Replace with your actual URL

  Future<void> _login(BuildContext context) async {
    final response = await http.post(
      Uri.parse(_loginUrl),
      body: {
        'username': usernameController.text,
        'password': passwordController.text
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (contecx) {
        return Homepage();
      }));
    } else {
      print('Login failed: ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed: Server error'),
        ),
      );
    }
  }

  void Login(BuildContext context, String username, String password) {
    print('Login successful!');
    if (username == "admin" && password == "admin") {
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Homepage();
          }),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Warning'),
          content: const Text('Password Salah, silahkan ulangi lagi'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Align(alignment: Alignment.centerRight, child: Text('Login')),
          leading: Icon(Icons.home),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formkey,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.asset("assets/flutter.png"),
                    width: 200,
                    height: 200,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                      validator: (value) {
                        if (value == null || value!.isEmpty) {
                          return 'Username tidak boleh kosong';
                        }
                        return null;
                      },
                      controller: usernameController,
                      decoration: InputDecoration(
                          labelText: 'username', border: OutlineInputBorder())),
                  SizedBox(height: 10),
                  TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password tidak boleh kosong';
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'password', border: OutlineInputBorder())),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisPage()));
                          },
                          child: Text('Register')),
                      ElevatedButton(
                          onPressed: () {
                            print('klik login');

                            // if (formkey.currentState!.validate()) {

                            // Login(context, usernameController.text,
                            //     passwordController.text);
                            _login(context);

                            // }
                          },
                          child: Text('Login')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}