import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

getColor(String type) {
  if (type == 'Add') return Colors.green;
  if (type == 'Modify') return Colors.blue;
  if (type == 'Delete') return Colors.red;
}

getActivities() {
  return FirebaseFirestore.instance
      .collection('activity')
      .orderBy("time", descending: true)
      .snapshots();
}

class History extends StatefulWidget {
  final String device;

  const History({Key key, this.device}) : super(key: key);
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return widget.device == "Web"
        ? Drawer(child: Common())
        : Scaffold(
            appBar: AppBar(
              title: Text('History'),
              centerTitle: true,
            ),
            body: Common(),
          );
  }
}

class Common extends StatefulWidget {
  @override
  _CommonState createState() => _CommonState();
}

class _CommonState extends State<Common> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          // DrawerHeader(
          //     child: Center(
          //   child: Text('History',
          //       style: TextStyle(
          //           fontWeight: FontWeight.w500,
          //           color: Colors.black,
          //           fontSize: 20)),
          // )),
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
                            color: getColor(snapshot.data.docs[index]['type'])),
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
    );
  }
}
