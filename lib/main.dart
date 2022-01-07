import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/resources/resources.dart';
import 'package:todo/src/landing_pages/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: SplashView.route,
      getPages: [
        GetPage(name: SplashView.route, page: () => const SplashView()),
        GetPage(name: "/name", page: () => const SplashView()),
      ],
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: R.colors.themeColor,
      ),
    );
  }
}
