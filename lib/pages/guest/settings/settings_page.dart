import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../custom/elevated_button_c.dart';
import '../../../us/button_us.dart';
import '../../../utils/colors.dart';
import '../../../utils/lan.dart';
import '../../../utils/styles.dart';
import '../../../utils/titles.dart';
import '../../log_in/log_in_page.dart';
import '../../teacher/account/innner/lan/lan_page.dart';
import '../bnb/bnb_page.dart';
import 'settings_vm.dart';

class GSettingsPage extends StatelessWidget {
  const GSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsVM>(
      create: (_) => SettingsVM(),
      child: Consumer<SettingsVM>(
        builder: (context, SettingsVM vm, _) {
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 10),
              Divider(color: c.c3),
              ListTile(
                title: Text(
                  '${lan(t.language)} - ${lan(currLan)}',
                  style: s.t(
                    size: 20,
                    weight: FontWeight.w600,
                    color: c.c3,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const TLanPage(),
                      ),
                    ).then((value) {
                      if (value != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const GBNBPage(),
                          ),
                        );
                      }
                    });
                  },
                  splashRadius: 30,
                  icon: Icon(
                    CupertinoIcons.chevron_right,
                    color: c.c3,
                    size: 30,
                  ),
                ),
              ),
              Divider(color: c.c3),
              const SizedBox(height: 20),
              ElevatedButtonC(
                us: ButtonUS(
                  title: lan(t.login),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LogInPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
