import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maktab_234/pages/director/system/inner/call_schedule/view/add_schedules_vm.dart';
import 'package:provider/provider.dart';

import '../../../../../../custom/elevated_button_c.dart';
import '../../../../../../models/school_model.dart';
import '../../../../../../us/button_us.dart';
import '../../../../../../utils/colors.dart';
import '../../../../../../utils/format.dart';
import '../../../../../../utils/lan.dart';
import '../../../../../../utils/styles.dart';
import '../../../../../../utils/titles.dart';
import '../../../../../director/system/inner/call_schedule/view/detail_schedule.dart';

class GDetailClass extends StatelessWidget {
  final ScheduleClassModel info;

  const GDetailClass({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<SchedulesAddVM>(
      create: (BuildContext context) => SchedulesAddVM(),
      child: Consumer<SchedulesAddVM>(
        builder: (context, SchedulesAddVM vm, _) {
          return Scaffold(
            backgroundColor: c.c1,
            appBar: AppBar(
              backgroundColor: c.c3,
              title: Text(
                '${lan(t.detailClass)}, ${info.grade}',
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
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                    children: [
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: t.shortDays.sublist(0, 6).map((e) {
                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  vm.selectDay(e);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 2,
                                  ),
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: vm.day == e ? c.c3 : c.c1,
                                    border: vm.day == e
                                        ? null
                                        : Border.all(
                                            width: 2,
                                            color: c.c3,
                                          ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    lan(e),
                                    style: s.t(
                                      color: vm.day == e ? c.c1 : c.c3,
                                      size: 17.5,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      vm.day != null
                          ? Column(
                              children: List.generate(
                                  info.schedules[t.shortDays.indexOf(vm.day!)]
                                      .schedules.length, (int index) {
                                final e = info
                                    .schedules[t.shortDays.indexOf(vm.day!)]
                                    .schedules[index];
                                return Card(
                                  color: c.c3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    minLeadingWidth: 15,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    leading: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        '${index + 1}',
                                        style: s.t(
                                          color: c.c1,
                                          size: 20,
                                          weight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      e.science,
                                      style: s.t(
                                        color: c.c1,
                                        size: 20,
                                        weight: FontWeight.w700,
                                      ),
                                    ),
                                    subtitle: Text(
                                      e.teacher,
                                      style: s.t(
                                        color: c.c1,
                                        size: 17.5,
                                        weight: FontWeight.w500,
                                      ),
                                    ),
                                    trailing: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          format.formatTime2(e.startTime),
                                          style: s.t(
                                            color: c.c1,
                                            size: 17,
                                            weight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          format.formatTime2(e.endTime),
                                          style: s.t(
                                            color: c.c1,
                                            size: 17,
                                            weight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            )
                          : const SizedBox.shrink(),
                    ],
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
