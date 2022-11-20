import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vuldt_task_calender/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      debugShowCheckedModeBanner: false,
      title: 'vuldt_task_calendar',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
