import 'package:maktab_234/services/fb_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../models/science_model.dart';

class TNewsVM extends ChangeNotifier {
  String? centerId;
  bool isLoading = false;

  TNewsVM() {
    if (centerId != null) return;
    _update();
    fb.getTeacher().then((value) {
      centerId = value?.centerId;
      notifyListeners();
    });
    _update();
  }

  String getScience(String id) {
    if (fb.allSciences.isEmpty) return '';
    return fb.allSciences.firstWhere((element) => element.id == id).name;
  }

  void _update() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
