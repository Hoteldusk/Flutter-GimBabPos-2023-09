import 'package:flutter/material.dart';
import 'package:gimbabpos/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:gimbabpos/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<bool> buttonStates = List.generate(12, (index) => false);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(buttonStates: buttonStates),
    );
  }
}
