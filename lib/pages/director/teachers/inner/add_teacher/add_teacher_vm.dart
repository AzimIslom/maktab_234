import 'package:flutter/cupertino.dart';

import '../../../../../models/generate_model.dart';
import '../../../../../services/fb_firestore_service.dart';
import '../../../../../utils/keys.dart';

class AddTeacherVM extends ChangeNotifier {
  bool isLoading = false;
  List<GenerateModel> tokens = [];

  Future<void> generateNewToken() async {
    _update();
    await fb.generate(keys.teacher).then((value) {
      if (value == null) return;
      tokens.add(value);
    });
    _update();
  }

  AddTeacherVM() {
    getAllTokens();
  }

  void getAllTokens() async {
    _update();
    tokens = await fb.getAllGenerate();
    _update();
  }

  void deleteToken(GenerateModel token) async {
    _update();
    tokens.remove(token);
    await fb.deleteToken(token);
    _update();
  }

  void _update() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
