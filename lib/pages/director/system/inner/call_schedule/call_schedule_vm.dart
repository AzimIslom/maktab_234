import 'package:flutter/material.dart';
import '../../../../../models/school_model.dart';
import '../../../../../us/text_field_us.dart';
import '../../../../../utils/hints.dart';
import '../../../../../utils/lan.dart';
import '../../../../../utils/titles.dart';

class DCallScheduleVM extends ChangeNotifier {
  Duration? start;
  Duration? end;
  bool isLoading = false;
  TextFieldUS des = TextFieldUS(
    controller: TextEditingController(),
    title: lan(h.des),
    isMultiline: true,
  );
  Map<String, String?> errors = {};

  DCallScheduleVM([bool a = true]) {
    _init();
    if (a) {
    }
  }

  void _init() {
    errors = {
      t.startTime: null,
      t.endTime: null,
      h.des: null,
    };
  }

  void nf() {
    notifyListeners();
  }


  Future<Deleted> update() async {
    _update();
    final e = DateTime(2023, 3, 3, end!.inHours, end!.inMinutes % 60);
    final s = DateTime(2023, 3, 3, start!.inHours, start!.inMinutes % 60);
    Deleted schedule = Deleted(
      des: des.controller.text,
      endTime: e,
      startTime: s,
    );
    _update();
    return schedule;
  }

  void initEnd(Duration val) {
    end = val;
    notifyListeners();
  }

  void initStart(Duration val) {
    start = val;
    notifyListeners();
  }

  void setState(Deleted schedule) {
    notifyListeners();
  }

  void _update() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
