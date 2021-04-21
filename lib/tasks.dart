import 'package:dsc_todo/signin.dart';
import 'package:dsc_todo/widgets/dialog.dart';
import 'package:dsc_todo/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Tasks extends StatefulWidget {
  @required
  final String cluster;

  const Tasks({Key key, this.cluster}) : super(key: key);
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  dataStream() {
    return FirebaseFirestore.instance
        .collection('tasks')
        .where("cluster", isEqualTo: widget.cluster)
        .snapshots();
  }

  checkAccess() {
    return FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
  }

  taskStatus(bool s) {
    return s ? "Done" : "Pending";
  }

  var id;
  bool access = false;
  String name;
  bool check = false;

  getColor(String type) {
    if (type == 'Add') return Colors.green;
    if (type == 'Modify') return Colors.blue;
    if (type == 'Delete') return Colors.red;
  }

  getActivities() {
    return FirebaseFirestore.instance.collection('activity').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('DSC SASTRA University'),
        actions: [
          Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: IconButton(
                icon: Icon(Icons.history),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                tooltip: 'See activity history',
              ),
            ),
          ),
        ],
      ),
      body: Row(children: <Widget>[
        CustomDrawer(
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
                                onLongPress: () {
                                  if (widget.cluster == "DSC Common works" ||
                                      access) {
                                    id = snapshot.data.docs[index].id;
                                    FirebaseFirestore.instance
                                        .collection('activity')
                                        .add({
                                      "action": name +
                                          " deleted a Task - " +
                                          snapshot.data.docs[index]['title'] +
                                          " in " +
                                          widget.cluster,
                                      "type": "Delete"
                                    });
                                    FirebaseFirestore.instance
                                        .collection('tasks')
                                        .doc(id)
                                        .delete();
                                  }
                                },
                                onTap: () async {
                                  if (widget.cluster == "DSC Common works" ||
                                      access) {
                                    id = snapshot.data.docs[index].id;
                                    await FirebaseFirestore.instance
                                        .collection('tasks')
                                        .doc(id)
                                        .update({
                                      "isdone": !snapshot.data.docs[index]
                                          ['isdone']
                                    });
                                    await FirebaseFirestore.instance
                                        .collection('activity')
                                        .add({
                                      "action": name +
                                          " updated a Task - " +
                                          snapshot.data.docs[index]['title'] +
                                          " - " +
                                          taskStatus(!snapshot.data.docs[index]
                                              ['isdone']) +
                                          " in " +
                                          widget.cluster,
                                      "type": "Modify"
                                    });
                                  }
                                },
                                //
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
                ))),
        Drawer(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                  child: Center(
                child: Text('History',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 20)),
              )),
              StreamBuilder(
                stream: getActivities(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.size,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            snapshot.data.docs[index]['action'],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: getColor(
                                    snapshot.data.docs[index]['type'])),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        )),
      ]),
      floatingActionButton: StreamBuilder(
        stream: checkAccess(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data['cluster'] == widget.cluster ||
                widget.cluster == "DSC Common works") {
              access = true;
              name = snapshot.data['name'];
              return FloatingActionButton(
                tooltip: 'Add tasks',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return MyDialog(
                          cluster: widget.cluster,
                          name: name,
                        );
                      });
                },
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
