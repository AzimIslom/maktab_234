import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maktab_234/models/generate_model.dart';
import 'pages/director/bnb/bnb_page.dart';
import 'pages/guest/bnb/bnb_page.dart';
import 'pages/teacher/bnb/bnb_page.dart';
import 'services/fb_auth_service.dart';
import 'services/fb_firestore_service.dart';
import 'utils/keys.dart';
import 'utils/lan.dart';
import 'utils/titles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  await fb.init();
  await lan.init();
  t.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      title: '234-Maktab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: auth.stream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.email!.endsWith('.${keys.director}@gmail.com')) {
              return const DBNBPage();
            } else if (snapshot.data!.email!
                .endsWith('.${keys.teacher}@gmail.com')) {
              return const TBNBPage();
            }
            return const SizedBox.shrink();
          }
          return const GBNBPage();
        },
      ), //
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.invertedStylus,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}
