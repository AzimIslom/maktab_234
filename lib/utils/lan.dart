import 'package:maktab_234/utils/titles.dart';

import '../services/db_service.dart';
import 'keys.dart';
import 'lan/en.dart';
import 'lan/krill.dart';
import 'lan/ru.dart';
import 'lan/uz.dart';

String currLan = keys.no;

final lan = Lan.instance;

class Lan {
  Lan._();

  Future<void> init() async {
    print('inittttttt');
    await db.take().then((value) {
      currLan = value;
    });
  }

  static Lan instance = Lan._();

  String call(String key, [String? l]) {
    if (currLan == keys.no && l == null) return '...';
    if ((l ?? currLan) == keys.en) {
      return en[key] ?? key;
    } else if ((l ?? currLan) == keys.uz) {
      return uz[key] ?? key;
    } else if ((l ?? currLan) == keys.ru) {
      return ru[key] ?? key;
    } else if ((l ?? currLan) == keys.krill) {
      return krill[key] ?? key;
    } else {
      return key;
    }
  }

  Future<void> change(LanModel newLan) async {
    currLan = newLan.code;
    await db.set();
  }
}
