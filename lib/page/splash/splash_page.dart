// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:e_commerces/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      controller.validateAuth();
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset('assets/animation/loading.json'),
            Text(
              'ກຳລັງໂຫລດຂໍ້ມູນ..',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
