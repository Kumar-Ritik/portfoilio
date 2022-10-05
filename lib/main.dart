import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/pages/homepage.dart';
import 'package:portfolio_app/pages/loginpage.dart';
import 'firebase_options.dart';
import 'pages/homepage.dart';

// sbse phele ye package import kro
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => Homepage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
