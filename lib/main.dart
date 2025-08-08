import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/daily_news/presentation/controller/article/remote/remote_article_bloc.dart';
import 'features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:mind_feed/injection_container.dart';

import 'config/theme/app_themes.dart';
import 'features/daily_news/presentation/controller/article/remote/remote_article_event.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
