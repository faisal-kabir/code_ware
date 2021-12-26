
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_ware/Controller/splash_controller.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {

  SplashController splashController = Get.put(SplashController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashController.makeAnimation(this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ScaleTransition(
          scale: Tween(begin: 1.7, end: 0.7).animate(CurvedAnimation(
              parent: splashController.controller!.value, curve: Curves.easeInCirc)),
          child: Center(
            child: Image.asset('assets/banner.png',width: Get.width*0.9,),
          ),
        );
      }),
    );
  }
}
