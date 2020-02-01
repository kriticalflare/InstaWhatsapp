import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta_whatsapp/onboarding/screens/onboarding_screen.dart';
import 'package:insta_whatsapp/ui/home_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDir = await getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  var hiveBox = await Hive.openBox('insta_whatsapp');
  bool isFirstRun = hiveBox.get('first_run');
  print('hive: $isFirstRun');
  runApp(MyApp(isFirstRun: isFirstRun,));
}

class MyApp extends StatelessWidget {
  final bool isFirstRun;
  MyApp({this.isFirstRun});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaWhatsapp',
      theme: ThemeData.dark().copyWith(accentColor: Colors.greenAccent),
      home: isFirstRun == null ? OnboardingScreen() : HomePage(),
    );
  }
}
