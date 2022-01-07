import 'package:flutter/material.dart';

import 'profile/view/profile_view.dart';
import 'todo/view/todo_view.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);
  static String route = '/base';

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: const [TodoView(), ProfileView()],
      ),
    );
  }
}
