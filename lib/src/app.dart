import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/home.dart';
// import 'package:flutter_challenge/src/profiles/profile_1.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SmartHomeSlide(),
    );
  }
}
