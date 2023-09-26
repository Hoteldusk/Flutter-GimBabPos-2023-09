import 'package:flutter/material.dart';
import 'package:gimbabpos/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:gimbabpos/main_page.dart';
import 'package:gimbabpos/provier.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => ProcductStore()),
        ChangeNotifierProvider(create: (c) => OrderStore()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
