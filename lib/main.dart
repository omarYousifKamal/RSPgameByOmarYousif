import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/start_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'لعبة حجر ورقة مقص',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
    );
  }
}
