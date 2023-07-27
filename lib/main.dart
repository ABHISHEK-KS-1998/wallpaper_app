import 'package:flutter/material.dart';
import 'package:wallpaper_app_2/wallpaper.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       brightness: Brightness.dark,
      ),
      home: Wallpaper(),
    );
  }
}
