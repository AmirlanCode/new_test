import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iam_back/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:iam_back/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:iam_back/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:iam_back/injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        home: const Scaffold(
          body: DailyNews(),
        ),
      ),
    );
  }
}
