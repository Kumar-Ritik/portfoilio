import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'job.dart';
import 'login_text.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //const LoginPage({Key? key}) : super(key: key);
  final controller = Get.put(LoginController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
      body: SafeArea(
        child: Container(
          //height: ,
          //width: MediaQuery.of(context).size.width,
          //height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Image.asset(
                "assets/images/job.png",
                //fit: BoxFit.cover,
                height: 64,
              ),
              TextFieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              Builder(builder: (context) {
                return FloatingActionButton.extended(
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
                );
              }),
              SizedBox(
                height: 10,
              ),
              Image.asset(
                "images/hired.png",
                //fit: BoxFit.cover,
                height: 64,
              ),
              TextFieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              // const SizedBox(
              //   height: 24,
              // ),
              InkWell(
                child: Container(
                  child: !_isLoading
                      ? const Text(
                          'Log in',
                        )
                      : const CircularProgressIndicator(
                          color: Color.fromARGB(198, 18, 190, 116),
                        ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: Color.fromARGB(236, 163, 0, 0),
                  ),
                ),
                //onTap: loginUser,
              ),
              // const SizedBox(
              //   height: 12,
              // ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
