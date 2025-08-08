import 'package:flutter/material.dart';
import 'package:mind_feed/features/auth/presentation/pages/home/daily_new.dart';
import 'package:mind_feed/injection_container.dart';

import 'config/theme/app_themes.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const DailyNews(),
    );
  }
}
