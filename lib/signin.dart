import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_todo/tasks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

var uid;

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign In help'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'If you are new to this platform, enter the credentials you want and click register. After successful registration you can login with the same credentials from next time. '),
                Text('Register option is only for first time users!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Got it'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final TextEditingController userName = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController name = new TextEditingController();
  var cluster;
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
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              _showMyDialog();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.help_outline_outlined),
            ),
          ),
        ],
        title: Text('DSC SASTRA University'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/4/45/GDevs.png',
            height: 60,
          ),
          TextField(
            controller: userName,
            showCursor: true,
            decoration: InputDecoration(
              hintText: 'E-Mail',
            ),
          ),
          TextField(
            controller: password,
            obscureText: true,
            showCursor: true,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          TextField(
            controller: name,
            obscureText: true,
            showCursor: true,
            decoration: InputDecoration(
              hintText: 'Name (Only for Registration)',
            ),
          ),
          new DropdownButton<String>(
            hint: Text('Cluster (Only for Registration)'),
            items: <String>[
              'Android',
              'Cyber Security',
              'Machine Learning',
              'Flutter',
              'Google Cloud',
              'Web',
              'Design',
              'Event Coverage',
              'AR/VR',
              'Content Writing'
            ].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (value) {
              cluster = value;
            },
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: userName.text, password: password.text)
                          .then((value) {
                        uid = value.user.uid;
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Tasks(
                                  cluster: "DSC Common works",
                                )));
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
              SizedBox(
                width: 40,
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: userName.text, password: password.text)
                          .then((value) {
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(value.user.uid)
                            .set({
                          "email": userName.text,
                          "cluster": cluster,
                          "name": name.text
                        });
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
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Text('This software is only for DSC CORE TEAM members only!'),
        ]),
      ),
    );
  }
}
