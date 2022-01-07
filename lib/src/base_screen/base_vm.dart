import 'package:flutter/cupertino.dart';

class BaseVM extends ChangeNotifier {
  int baseCurrentPage = 0;

  updatePage(int index) {
    baseCurrentPage = index;
    notifyListeners();
  }
}
