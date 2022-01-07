import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/resources/resources.dart';
import 'package:todo/src/auth/view/auth_view.dart';

class SplashView extends StatefulWidget {
  static String route = '/splash';
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AuthView.route);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: R.colors.themeColor,
        child: Center(
          child: Text(
            "TODO APP",
            style: TextStyle(
                color: R.colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
