import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../signin.dart';
import '../tasks.dart';

class CustomDrawer extends StatefulWidget {
  final String cluster;

  const CustomDrawer({Key key, this.cluster}) : super(key: key);
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: Container(
        color: Colors.green,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 70),
              ListTile(
                tileColor: widget.cluster == 'DSC Common works'
                    ? Color(0xffF4B400)
                    : Colors.transparent,
                title: Text(
                  'DSC Common works',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 0),
                          reverseTransitionDuration: Duration(seconds: 0),
                          pageBuilder: (context, animation1, animation2) =>
                              Tasks(
                                cluster: "DSC Common works",
                              )),
                      (route) => false);
                },
              ),
              ListTile(
                tileColor: widget.cluster == 'Android'
                    ? Color(0xffF4B400)
                    : Colors.transparent,
                title: Text(
                  'Android',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 0),
                          reverseTransitionDuration: Duration(seconds: 0),
                          pageBuilder: (context, animation1, animation2) =>
                              Tasks(
                                cluster: "Android",
                              )),
                      (route) => false);
                },
              ),
              ListTile(
                tileColor: widget.cluster == 'AR/VR'
                    ? Color(0xffF4B400)
                    : Colors.transparent,
                title: Text(
                  'AR/VR',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 0),
                          reverseTransitionDuration: Duration(seconds: 0),
                          pageBuilder: (context, animation1, animation2) =>
                              Tasks(
                                cluster: "AR/VR",
                              )),
                      (route) => false);
                },
              ),
              ListTile(
                tileColor: widget.cluster == 'Content Writing'
                    ? Color(0xffF4B400)
                    : Colors.transparent,
                title: Text(
                  'Content Writing',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 0),
                          reverseTransitionDuration: Duration(seconds: 0),
                          pageBuilder: (context, animation1, animation2) =>
                              Tasks(
                                cluster: "Content Writing",
                              )),
                      (route) => false);
                },
              ),
              ListTile(
                tileColor: widget.cluster == 'Cyber Security'
                    ? Color(0xffF4B400)
                    : Colors.transparent,
                title: Text(
                  'Cyber Security',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 0),
                          reverseTransitionDuration: Duration(seconds: 0),
                          pageBuilder: (context, animation1, animation2) =>
                              Tasks(
                                cluster: "Cyber Security",
                              )),
                      (route) => false);
                },
              ),
              ListTile(
                tileColor: widget.cluster == 'Design'
                    ? Color(0xffF4B400)
                    : Colors.transparent,
                title: Text(
                  'Design',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 0),
                          reverseTransitionDuration: Duration(seconds: 0),
                          pageBuilder: (context, animation1, animation2) =>
                              Tasks(
                                cluster: "Design",
                              )),
                      (route) => false);
                },
              ),
              ListTile(
                tileColor: widget.cluster == 'Event Coverage'
                    ? Color(0xffF4B400)
                    : Colors.transparent,
                title: Text(
                  'Event coverage',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 0),
                          reverseTransitionDuration: Duration(seconds: 0),
                          pageBuilder: (context, animation1, animation2) =>
                              Tasks(
                                cluster: "Event Coverage",
                              )),
                      (route) => false);
                },
              ),
              ListTile(
                tileColor: widget.cluster == 'Flutter'
                    ? Color(0xffF4B400)
                    : Colors.transparent,
                title: Text(
                  'Flutter',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 0),
                          reverseTransitionDuration: Duration(seconds: 0),
                          pageBuilder: (context, animation1, animation2) =>
                              Tasks(
                                cluster: "Flutter",
                              )),
                      (route) => false);
                },
              ),
              ListTile(
                tileColor: widget.cluster == 'Google Cloud'
                    ? Color(0xffF4B400)
                    : Colors.transparent,
                title: Text(
                  'Google Cloud',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 0),
                          reverseTransitionDuration: Duration(seconds: 0),
                          pageBuilder: (context, animation1, animation2) =>
                              Tasks(
                                cluster: "Google Cloud",
                              )),
                      (route) => false);
                },
              ),
              ListTile(
                tileColor: widget.cluster == 'Machine Learning'
                    ? Color(0xffF4B400)
                    : Colors.transparent,
                title: Text(
                  'Machine Learning',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 0),
                          reverseTransitionDuration: Duration(seconds: 0),
                          pageBuilder: (context, animation1, animation2) =>
                              Tasks(
                                cluster: "Machine Learning",
                              )),
                      (route) => false);
                },
              ),
              ListTile(
                tileColor: widget.cluster == 'Web'
                    ? Color(0xffF4B400)
                    : Colors.transparent,
                title: Text(
                  'Web',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Navigator.of(context).pushAndRemoveUntil(

                  //     MaterialPageRoute(
                  //         builder: (context) => Tasks(
                  //               cluster: "Web",
                  //             )),
                  //     (route) => false);
                  Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 0),
                          reverseTransitionDuration: Duration(seconds: 0),
                          pageBuilder: (context, animation1, animation2) =>
                              Tasks(
                                cluster: "Web",
                              )),
                      (route) => false);
                },
              ),
              ListTile(
                tileColor: Colors.red,
                title: Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  try {
                    await FirebaseAuth.instance.signOut().then((value) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => SignInPage()),
                          (route) => false);
                      Fluttertoast.showToast(msg: 'Signed out Successfully');
                    });
                  } catch (e) {
                    Fluttertoast.showToast(msg: e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
