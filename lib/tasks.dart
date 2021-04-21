import 'package:dsc_todo/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Tasks extends StatefulWidget {
  @required
  final String cluster;

  const Tasks({Key key, this.cluster}) : super(key: key);
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  DateTime selectedDate = DateTime.now();
  int value = 2;

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _showMyDialog() async {
    final TextEditingController title = new TextEditingController();
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add task'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: title,
                  decoration: InputDecoration(hintText: 'Enter Task Name'),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${selectedDate.toLocal()}".split(' ')[0]),
                    GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Icon(Icons.calendar_today_rounded)),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Add'),
              onPressed: () async {
                await FirebaseFirestore.instance.collection('tasks').add({
                  "title": title.text,
                  "dueOn": "${selectedDate.toLocal()}".split(' ')[0],
                  "postedOn": "${DateTime.now().toLocal()}".split(' ')[0],
                  "cluster": widget.cluster,
                  "isdone": false,
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  dataStream() {
    return FirebaseFirestore.instance
        .collection('tasks')
        .where("cluster", isEqualTo: widget.cluster)
        .snapshots();
  }

  checkAccess() {
    return FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
  }

  var id;
  bool access = false;
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('DSC SASTRA University'),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app_sharp),
              onPressed: () async {
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
              })
        ],
      ),
      body: Row(children: <Widget>[
        SideLayout(
          cluster: widget.cluster,
        ),
        Expanded(
            flex: 5,
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: StreamBuilder(
                    stream: dataStream(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.size,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            id = snapshot.data.docs[index].id;
                            return Card(
                              color: Colors.white,
                              child: InkWell(
                                splashColor: Colors.blue,
                                onLongPress: access
                                    ? () {
                                        id = snapshot.data.docs[index].id;
                                        FirebaseFirestore.instance
                                            .collection('tasks')
                                            .doc(id)
                                            .delete();
                                      }
                                    : null,
                                onTap: access
                                    ? () {
                                        id = snapshot.data.docs[index].id;
                                        FirebaseFirestore.instance
                                            .collection('tasks')
                                            .doc(id)
                                            .update({
                                          "isdone": !snapshot.data.docs[index]
                                              ['isdone']
                                        });
                                      }
                                    : null,
                                child: SizedBox(
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        snapshot.data.docs[index]['isdone'] ==
                                                true
                                            ? Row(
                                                children: [
                                                  Icon(
                                                    Icons.check,
                                                    size: 15,
                                                    color: Colors.green,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Done',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.green),
                                                  )
                                                ],
                                              )
                                            : Row(
                                                children: [
                                                  Icon(
                                                    Icons.close,
                                                    size: 15,
                                                    color: Colors.red,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Pending',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.red),
                                                  )
                                                ],
                                              ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          snapshot.data.docs[index]['title'],
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          'Posted on: ' +
                                              "${snapshot.data.docs[index]['postedOn']}",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.blueGrey),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          "Due on: " +
                                              "${snapshot.data.docs[index]['dueOn']}",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.blueGrey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                )))
      ]),
      floatingActionButton: StreamBuilder(
        stream: checkAccess(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data['cluster'] == widget.cluster) {
              access = true;
              return FloatingActionButton(
                onPressed: _showMyDialog,
                backgroundColor: const Color(0xffF4B400),
                child: Icon(Icons.add),
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}

class SideLayout extends StatefulWidget {
  final String cluster;
  const SideLayout({Key key, this.cluster}) : super(key: key);

  @override
  _SideLayoutState createState() => _SideLayoutState();
}

class _SideLayoutState extends State<SideLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)),
            color: Colors.green,
            //   topLeft: Radius.circular(40.0),
            // bottomLeft: Radius.circular(40.0)
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
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
            ],
          ),
        ),
      ),
    );
  }
}
