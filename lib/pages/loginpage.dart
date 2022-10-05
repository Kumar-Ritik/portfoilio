import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "JOB & HIRE",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/job.png",
              fit: BoxFit.cover,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Username",
                labelText: "Username",
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Password",
                labelText: "Password",
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                GoogleSignIn().signIn();
              },
              icon: Image.asset(
                "images/google.png",
                fit: BoxFit.cover,
                height: 32,
                width: 32,
                //colorBlendMode: Colors.white,
              ),
              label: Text("Sign in with Google"),
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              "images/hired.png",
              fit: BoxFit.cover,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Username",
                labelText: "Username",
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Password",
                labelText: "Password",
              ),
            ),
          ],
        ),
      ),
      // Column(
      //   //mainAxisAlignment: MainAxisAlignment.center,
      //   //crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Image.asset(
      //       "images/hired.png",
      //       fit: BoxFit.cover,
      //     ),
      //   ],
      // ),
    );
  }
}
