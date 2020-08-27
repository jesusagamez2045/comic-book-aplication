import 'package:comicbook/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comic Book App',
      home: HomePage(),
    );
  }
}