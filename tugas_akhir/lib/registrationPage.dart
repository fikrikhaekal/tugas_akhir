import 'package:flutter/material.dart';
import 'package:tugas_akhir/homePage.dart';
import 'package:tugas_akhir/loginPage.dart';

class RegisPage extends StatelessWidget {
  const RegisPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final password1Controller = TextEditingController();
    final password2Controller = TextEditingController();

    final formkey = GlobalKey<FormState>();

    

    return Scaffold(
        appBar: AppBar(
          title: Align(
              alignment: Alignment.centerRight, child: Text('Registrasi')),
          leading: Icon(Icons.home),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formkey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.asset("assets/flutter.png"),
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: usernameController,
                      decoration: InputDecoration(
                          labelText: 'username', border: OutlineInputBorder())),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                      decoration: InputDecoration(
                          labelText: 'email', border: OutlineInputBorder())),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: password1Controller,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'password', border: OutlineInputBorder())),
                  SizedBox(height: 10),
                  TextFormField(
                      obscureText: true,
                      controller: password2Controller,
                      decoration: InputDecoration(
                          labelText: 'ulangi password',
                          border: OutlineInputBorder())),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loginpage()));
                          },
                          child: Text('Kembali')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loginpage()));
                          },
                          child: Text('Simpan')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}