import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:portfolio_app/pages/homepage.dart';
import 'package:portfolio_app/pages/utils.dart';

import '../resources/auth_methods.dart';
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
  final joBcontroller = Get.put(LoginController());
  final TextEditingController _joBemailController = TextEditingController();
  final TextEditingController _joBpasswordController = TextEditingController();
  bool _isjoBLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(
      //       builder: (context) => const ResponsiveLayout(
      //         mobileScreenLayout: MobileScreenLayout(),
      //         webScreenLayout: WebScreenLayout(),
      //       ),
      //     ),
      //     (route) => false);

      // setState(() {
      //   _isLoading = false;
      // });
    } else {
      setState(() {
        _isLoading = false;
      });
      () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Homepage(),
            ),
          );
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "JOB  HIRE",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ),
        body: Row(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Flexible(
                    //   child: Container(),
                    //   flex: 2,
                    // ),
                    SizedBox(
                      height: 250,
                      width: 250,
                      child: Image.asset(
                        "images/logo.png",
                        fit: BoxFit.cover,
                        //color: Colors.black,
                        //height: 64,
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFieldInput(
                        hintText: 'Enter your email',
                        textInputType: TextInputType.emailAddress,
                        textEditingController: _joBemailController,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFieldInput(
                        hintText: 'Enter your password',
                        textInputType: TextInputType.text,
                        textEditingController: _joBpasswordController,
                        isPass: true,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: 200,
                      child: InkWell(
                        child: Container(
                          child: !_isjoBLoading
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              color: Colors.blue),
                        ),
                        onTap: loginUser,
                      ),
                    ),
                    // Builder(builder: (context) {
                    //   return FloatingActionButton.extended(
                    //     onPressed: () {
                    //       GoogleSignIn().signIn();
                    //     },
                    //     icon: Image.asset(
                    //       "images/google.png",
                    //       fit: BoxFit.cover,
                    //       height: 32,
                    //       width: 32,
                    //     ),
                    //     label: Text("Sign in with Google"),
                    //     backgroundColor: Colors.white,
                    //     foregroundColor: Colors.blue,
                    //   );
                    // }),
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      child: const Text(
                        'Dont have an account?',
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Homepage(),
                        ),
                      ),
                      child: Container(
                        child: const Text(
                          ' Signup.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ]),
            ),
            Expanded(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "images/hired.png",
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: 400,
                    child: TextFieldInput(
                      hintText: 'Enter your email',
                      textInputType: TextInputType.emailAddress,
                      textEditingController: _emailController,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: 400,
                    child: TextFieldInput(
                      hintText: 'Enter your password',
                      textInputType: TextInputType.text,
                      textEditingController: _passwordController,
                      isPass: true,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: 200,
                    child: InkWell(
                      onTap: loginUser,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            color: Colors.blue),
                      ),
                      //onTap: loginUser,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: const Text(
                      'Dont have an account?',
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Homepage(),
                      ),
                    ),
                    child: Container(
                      child: const Text(
                        ' Signup.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
