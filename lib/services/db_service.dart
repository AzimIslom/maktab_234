import 'package:shared_preferences/shared_preferences.dart';

import '../utils/keys.dart';
import '../utils/lan.dart';

final db = DBService.instance;

class DBService {
  DBService._();

  static DBService instance = DBService._();

  Future<String?> set() async {
    try {
      final db = await SharedPreferences.getInstance();
      await db.setString(keys.lan, currLan!);
      return null;
    } catch (e) {
      return 'error';
    }
  }

  Future<String> take() async {
    try {
      final db = await SharedPreferences.getInstance();
      final res = (db.get(keys.lan) as String?) ?? keys.en;
      return res;
    } catch (e) {
      print('take: $e');
      return keys.en;
    }
  }
}
