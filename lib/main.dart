import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/tabBarScreen/tabBar.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsTabBar(),
    );
  }
}