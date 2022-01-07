import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todo/resources/resources.dart';
import 'package:todo/src/auth/view/auth_view.dart';
import 'package:todo/src/base_screen/base_view.dart';
import 'package:todo/src/base_screen/profile/view/profile_view.dart';
import 'package:todo/src/base_screen/todo/view/todo_view.dart';
import 'package:todo/src/base_screen/todo/view_model/todo_vm.dart';
import 'package:todo/src/landing_pages/view/splash.dart';

import 'src/base_screen/base_vm.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TodoVM()),
    ChangeNotifierProvider(create: (context) => BaseVM()),
  ], child: const MyApp()));
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
        GetPage(name: AuthView.route, page: () => const AuthView()),
        GetPage(name: BaseView.route, page: () => const BaseView()),
        GetPage(name: TodoView.route, page: () => const TodoView()),
        GetPage(name: ProfileView.route, page: () => const ProfileView()),
      ],
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: R.colors.themeColor,
      ),
    );
  }
}
