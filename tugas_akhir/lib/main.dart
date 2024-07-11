import 'package:flutter/material.dart';
import 'package:tugas_akhir/homePage.dart';
import 'package:tugas_akhir/loginPage.dart';
import 'package:tugas_akhir/registrationPage.dart';

void main() {
  runApp(const tugas_akhir());
}

class tugas_akhir extends StatelessWidget {
  const tugas_akhir({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1944089679.
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
        debugShowCheckedModeBanner: false,
        home: Loginpage());
  }
}