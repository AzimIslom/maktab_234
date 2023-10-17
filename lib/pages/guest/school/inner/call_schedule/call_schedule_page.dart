import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';

import '../../../../../models/school_model.dart';
import '../../../../../services/fb_firestore_service.dart';
import '../../../../../utils/format.dart';
import '../../../../director/system/inner/call_schedule/view/detail_class.dart';
import 'call_schedule_vm.dart';
import 'view/add_call_schedule.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/lan.dart';
import '../../../../../utils/styles.dart';
import '../../../../../utils/titles.dart';
import 'view/detail_class.dart';

class GCallSchedulePage extends StatefulWidget {
  const GCallSchedulePage({super.key});

  @override
  State<GCallSchedulePage> createState() => _GCallSchedulePageState();
}

class _GCallSchedulePageState extends State<GCallSchedulePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<GCallScheduleVM>(
      create: (_) => GCallScheduleVM(),
      child: Consumer<GCallScheduleVM>(
        builder: (context, GCallScheduleVM vm, _) {
          return Scaffold(
            backgroundColor: c.c1,
            appBar: AppBar(
              backgroundColor: c.c3,
              title: Text(
                lan(t.schedule),
                style: s.t(
                  color: c.c1,
                  size: 20,
                  weight: FontWeight.w700,
                ),
              ),
            ),
            body: Stack(
              children: [
                IgnorePointer(
                  ignoring: vm.isLoading,
                  child: FirestoreListView<ScheduleClassModel>(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    pageSize: 15,
                    query: fb.schedules(),
                    itemBuilder: (BuildContext context,
                        QueryDocumentSnapshot<ScheduleClassModel> doc) {
                      final ScheduleClassModel schedule = doc.data();
                      return Card(
                        color: c.c3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => GDetailClass(info: schedule),
                              ),
                            );
                          },
                          title: Text(
                            schedule.grade,
                            style: s.t(
                              color: c.c1,
                              size: 20,
                              weight: FontWeight.w700,
                            ),
                          ),
                          subtitle: Text(
                            schedule.classTeacher,
                            style: s.t(
                              color: c.c1,
                              size: 17.5,
                              weight: FontWeight.w600,
                            ),
                          ),
                          trailing: Icon(
                            CupertinoIcons.chevron_right,
                            color: c.c1,
                            size: 30,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                vm.isLoading
                    ? Container(
                        height: size.height,
                        width: size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.3),
                        ),
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: CircularProgressIndicator(
                            color: c.c1,
                            strokeWidth: 7,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }
}
