import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/pages/homepage.dart';
import 'package:portfolio_app/pages/loginpage.dart';
import 'package:portfolio_app/pages/signup_screen.dart';
import 'firebase_options.dart';
import 'pages/homepage.dart';

// sbse phele ye package import kro DefaultFirebaseOptions.currentPlatform,
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyC2I5yN-bUiXl8E9Ltc6amwaXoltqDrAe4",
    //authDomain: "ritik-firebase.firebaseapp.com",
    projectId: "ritik-firebase",
    storageBucket: "ritik-firebase.appspot.com",
    messagingSenderId: "167904333192",
    appId: "1:167904333192:web:4b90ef93d0d22305ccbe3d",
    //measurementId: "G-1DL3GR5RLQ"
  ));
  runApp(MyApp());
}

// just typ stl StatelessWidget bnane k liye
// for wraping click on blub
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Homepage(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SignupScreen(),
        "/home": (context) => Homepage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
