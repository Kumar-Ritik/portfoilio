import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  final String s = "Welcome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JoB and Hire"),
      ),
      body: Center(
        child: Container(
          child: Text(s),
        ),
      ),
    );
  }
}
