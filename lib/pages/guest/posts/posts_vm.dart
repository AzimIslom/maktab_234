import 'package:flutter/material.dart';

import '../../../models/science_model.dart';
import '../../../services/fb_firestore_service.dart';


class GPostsVM extends ChangeNotifier {

  String getScience(String id) {
    if (fb.allSciences.isEmpty) return '';
    return fb.allSciences.firstWhere((element) => element.id == id).name;
  }
}
