import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String name;
bool access = false;
dataStream(String cluster) {
  return FirebaseFirestore.instance
      .collection('tasks')
      .where("cluster", isEqualTo: cluster)
      .orderBy("time", descending: true)
      .snapshots();
}

taskStatus(bool s) {
  return s ? "Done" : "Pending";
}

class MainBody extends StatefulWidget {
  final String cluster;
  final String device;

  const MainBody({Key key, @required this.cluster, @required this.device})
      : super(key: key);
  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  var id;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: dataStream(widget.cluster),
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
                    if (widget.cluster == "DSC Common works" || access) {
                      id = snapshot.data.docs[index].id;
                      FirebaseFirestore.instance.collection('activity').add({
                        "action": name +
                            " deleted a Task - " +
                            snapshot.data.docs[index]['title'] +
                            " in " +
                            widget.cluster,
                        "type": "Delete",
                        "time": DateTime.now()
                      });
                      FirebaseFirestore.instance
                          .collection('tasks')
                          .doc(id)
                          .delete();
                    }
                  },
                  onTap: () async {
                    if (widget.cluster == "DSC Common works" || access) {
                      id = snapshot.data.docs[index].id;
                      await FirebaseFirestore.instance
                          .collection('tasks')
                          .doc(id)
                          .update(
                              {"isdone": !snapshot.data.docs[index]['isdone']});
                      await FirebaseFirestore.instance
                          .collection('activity')
                          .add({
                        "action": name +
                            " updated a Task - " +
                            snapshot.data.docs[index]['title'] +
                            " - " +
                            taskStatus(!snapshot.data.docs[index]['isdone']) +
                            " in " +
                            widget.cluster,
                        "type": "Modify",
                        "time": DateTime.now()
                      });
                    }
                  },
                  //
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: widget.device == "Web"
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                snapshot.data.docs[index]['isdone'] == true
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
                                      fontSize: 10, color: Colors.blueGrey),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Due on: " +
                                      "${snapshot.data.docs[index]['dueOn']}",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.blueGrey),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                snapshot.data.docs[index]['isdone'] == true
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
                                      fontSize: 10, color: Colors.blueGrey),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Due on: " +
                                      "${snapshot.data.docs[index]['dueOn']}",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.blueGrey),
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
    );
  }
}
