import 'package:flutter/material.dart';

class PrideVM extends ChangeNotifier {
  bool isLoading = false;
  void nf() {
    notifyListeners();
  }

}
