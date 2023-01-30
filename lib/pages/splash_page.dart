// ignore_for_file: file_names

import 'dart:async';
import 'package:alsafier/pages/parsonal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const_color.dart';
import 'home_page.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.off(
        HomePage(),
        transition: Transition.fadeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [kColor, Colors.white])),
        child: const Center(
          child: Image(
            image: AssetImage(
                'assets/images/WhatsApp Image 2022-11-27 at 3.37.09 PM-PhotoRoom.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
