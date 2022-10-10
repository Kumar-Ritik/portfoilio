import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'login_text.dart';
import 'package:portfolio_app/models/user.dart' as model;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final String s = "Welcome";
  bool _isLoading = false;
  String username = "";

  // addData() async {
  //   UserProvider _userProvider =
  //       Provider.of<UserProvider>(context, listen: false);
  //   await _userProvider.refreshUser();
  // }

  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await _userProvider.refreshUser();
  }
  // void initState() {
  //   super.initState();
  //   getUsername();
  // }

  // void getUsername() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //   //print(snap.data().['username']);
  //   setState(() {
  //     username = (snap.data() as Map<String, dynamic>)['username'];
  //   });
  // }

  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
        appBar: AppBar(
          title: Text("JOB & HIRE"),
        ),
        body: Row(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      // height: 250,
                      // width: 250,
                      child: Image.asset(
                        "images/job.png",
                        fit: BoxFit.cover,
                        //color: Colors.black,
                        //height: 64,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: 200,
                      child: InkWell(
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
                  ]),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(user.post),
                  Image.asset(
                    "images/hired.png",
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: 200,
                    child: InkWell(
                      //onTap: loginUser,
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
                ],
              ),
            ),
          ],
        ));
  }
}
