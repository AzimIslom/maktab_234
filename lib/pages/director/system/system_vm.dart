import 'package:flutter/foundation.dart';
import '../../../us/item_us.dart';
import '../../../utils/lan.dart';
import '../../../utils/titles.dart';
import 'inner/call_schedule/call_schedule_page.dart';
import 'inner/reception_time/reception_time_page.dart';
import 'inner/school_bio/school_bio_page.dart';
import 'inner/school_posts/school_posts_page.dart';
import 'inner/sciences/sciences_page.dart';
import 'inner/statute/statute_page.dart';

class DSystemVM extends ChangeNotifier {
  List<ItemUS> items = [];

  bool isGrid = false;

  DSystemVM() {
    init();
  }

  void init() async {
    items = [
      ItemUS(
        title: lan(t.sciences),
        page: const DSciencesPage(),
      ),
      ItemUS(
        title: lan(t.statute),
        page: const DStatutePage(),
      ),
      ItemUS(
        title: lan(t.schoolPosts),
        page: const DSchoolPostsPage(),
      ),
      ItemUS(
        title: lan(t.schoolBio),
        page: const DSchoolBioPage(),
      ),
      ItemUS(
        title: lan(t.callSchedule),
        page: const DCallSchedulePage(),
      ),
      ItemUS(
        title: lan(t.receptionTime),
        page: const DReceptionTimePage(),
      ),
      // ItemUS(
      //   title: lan(t.structure),
      //   page: const DStructurePage(),
      // ),
    ];
  }
}
