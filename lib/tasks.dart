import 'package:dsc_todo/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add task'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter task name'),
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
              onPressed: () {
                _addItem();
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

  _addItem() {
    setState(() {
      value = value + 1;
    });
  }

  _delItem() {
    setState(() {
      value = value - 1;
    });
  }

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
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => SignInPage()));
                    Fluttertoast.showToast(msg: 'Signed out Successfully');
                  });
                } catch (e) {
                  Fluttertoast.showToast(msg: e);
                }
              })
        ],
      ),
      body: Row(children: <Widget>[
        SideLayout(),
        Expanded(
            flex: 5,
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: StreamBuilder(
                  stream: dataStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.size,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            child: InkWell(
                              splashColor: Colors.blue,
                              onTap: () {
                                print('Card tapped.');
                              },
                              child: SizedBox(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            _delItem();
                                          },
                                          child: snapshot.data.docs[index]
                                                      ['isdone'] ==
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
                                                      'Marked as done',
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
                                                )),
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
                                            snapshot
                                                .data.docs[index]['postedOn']
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.blueGrey),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        'Due on: ' +
                                            snapshot.data.docs[index]['dueOn']
                                                .toString(),
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
                )))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _showMyDialog,
        backgroundColor: const Color(0xffF4B400),
        child: Icon(Icons.add),
      ),
    );
  }
}

class SideLayout extends StatelessWidget {
  const SideLayout({Key key}) : super(key: key);

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
                title: Text(
                  'Android',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Tasks(
                            cluster: "Android",
                          )));
                },
              ),
              ListTile(
                title: Text(
                  'AR/VR',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Tasks(
                            cluster: "AR/VR",
                          )));
                },
              ),
              ListTile(
                title: Text(
                  'Cyber Security',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Tasks(
                            cluster: "Cyber Security",
                          )));
                },
              ),
              ListTile(
                title: Text(
                  'Design',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Tasks(
                            cluster: "Design",
                          )));
                },
              ),
              ListTile(
                title: Text(
                  'Flutter',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Tasks(
                            cluster: "Flutter",
                          )));
                },
              ),
              ListTile(
                title: Text(
                  'Machine Learning',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Tasks(
                            cluster: "Machine Learning",
                          )));
                },
              ),
              ListTile(
                title: Text(
                  'Google Cloud',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Tasks(
                            cluster: "Google Cloud",
                          )));
                },
              ),
              ListTile(
                title: Text(
                  'Content Writing',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Tasks(
                            cluster: "Content Writing",
                          )));
                },
              ),
              ListTile(
                title: Text(
                  'Event coverage',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Tasks(
                            cluster: "Event Coverage",
                          )));
                },
              ),
              ListTile(
                title: Text(
                  'Web',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Tasks(
                            cluster: "Web",
                          )));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
