
import 'package:contact_details/home_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
 
void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp()));
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      useInheritedMediaQuery: true,
      title: 'Contact App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomeView(),
    );
  }
}
 