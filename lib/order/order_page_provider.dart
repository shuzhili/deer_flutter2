import 'package:flutter/cupertino.dart';

class OrderPageProvider extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void setIndex(value) {
    _index = value;
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }




}