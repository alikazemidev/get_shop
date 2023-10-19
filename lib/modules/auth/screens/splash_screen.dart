import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/modules/auth/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Opacity(
                    opacity: 0.1,
                    child: Image.asset(
                      'assets/images/pattern.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                  )
                ],
              ),
            ),
          );
        });
  }
}
