
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imbd_app_task/Dimensions/dimensions.dart';
import 'package:imbd_app_task/Screens/main_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 3),(timer) => Get.off(()=>MainScreen()),);

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE7B10A),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.bottomCenter,
                // color: Colors.blue,
                width: Dimensions.totalScreenWidth,
                child: const Text(
                  'IMDB',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.bottomCenter,
                // color: Colors.green,
                child: const CircularProgressIndicator(color: Colors.black,),
              ),
            ),
            Expanded(flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: const Text('Developed by Enacton Technologies'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
