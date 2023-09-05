import 'package:flutter/material.dart';
import 'package:qiita_app/screen/top_page.dart';

class QiitaApp extends StatelessWidget {
  const QiitaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Qiita App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(body: TopPage(title: "aaa")));
  }
}
