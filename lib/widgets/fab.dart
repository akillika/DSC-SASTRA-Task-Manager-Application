import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../signin.dart';
import 'dialog.dart';
import 'mainbody.dart';

class Fab extends StatefulWidget {
  final String cluster;

  const Fab({Key key, this.cluster}) : super(key: key);
  @override
  _FabState createState() => _FabState();
}

class _FabState extends State<Fab> {
  checkAccess() {
    return FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
    );
  }
}
