import 'dart:html';
import 'package:dsc_todo/main.dart';
import 'package:dsc_todo/success.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController userName = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FToast fToast;
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: userName,
            showCursor: true,
            decoration: InputDecoration(
              hintText: 'E-Mail',
            ),
          ),
          TextField(
            controller: password,
            showCursor: true,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: userName.text, password: password.text)
                      .then((value) {
                    Fluttertoast.showToast(
                        msg: 'Registered as ${userName.text}');
                  });
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    Fluttertoast.showToast(
                        msg: 'The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    Fluttertoast.showToast(
                        msg: 'The account already exists for that email.');
                  }
                } catch (e) {
                  Fluttertoast.showToast(msg: e);
                }
              },
              child: Text('Register')),
          ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: userName.text, password: password.text)
                      .then((value) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SuccessPage()));
                    Fluttertoast.showToast(
                        msg: 'Signed in as ${userName.text}');
                  });
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    Fluttertoast.showToast(
                        msg: 'No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    Fluttertoast.showToast(
                        msg: 'Wrong password provided for that user.');
                  }
                }
              },
              child: Text('Login')),
          ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut().then((value) {
                    Fluttertoast.showToast(msg: 'Signed out Successfully');
                  });
                } catch (e) {
                  Fluttertoast.showToast(msg: e);
                }
              },
              child: Text('Sign Out'))
        ],
      ),
    );
  }
}
