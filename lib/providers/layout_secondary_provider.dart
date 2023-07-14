import 'package:flutter/material.dart';

class LayoutSecondaryProvider with ChangeNotifier {
  int _currentIndex = 0;

  set currentIndex(int selectedIndex) {
    _currentIndex = selectedIndex;
    notifyListeners();
  }

  int get currentIndex => _currentIndex;
}
