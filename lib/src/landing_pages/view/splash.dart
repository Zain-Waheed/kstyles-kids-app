import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    Future.delayed(Duration(seconds: 3), () {
      Get.toNamed(AuthView.route);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: const Center(
        child: const Text("TODO APP"),
      ),
    );
  }
}
