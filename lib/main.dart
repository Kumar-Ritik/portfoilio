import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:portfolio_app/homepage.dart';
import 'homepage.dart';

// sbse phele ye package import kro
void main() {
  runApp(MyApp());
}

// just typ stl StatelessWidget bnane k liye
// for wraping click on blub
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}
