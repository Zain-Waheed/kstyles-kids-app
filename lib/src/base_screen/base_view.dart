import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_vm.dart';
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
    return Consumer<BaseVM>(builder: (context, vm, child) {
      return Scaffold(
        body: IndexedStack(
          index: vm.baseCurrentPage,
          children: const [TodoView(), ProfileView()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: vm.baseCurrentPage,
          onTap: (index) {
            vm.updatePage(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.description),label: "TODO"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile")
          ],
        ),
      );
    });
  }
}
