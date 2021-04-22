import 'dart:html';

import 'package:dsc_todo/widgets/drawer.dart';
import 'package:dsc_todo/widgets/fab.dart';
import 'package:dsc_todo/widgets/history.dart';
import 'package:dsc_todo/widgets/mainbody.dart';
import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  @required
  final String cluster;

  const Tasks({Key key, this.cluster}) : super(key: key);
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (width >= 992) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text('DSC SASTRA University'),
            ),
            body: Row(children: <Widget>[
              CustomDrawer(
                cluster: widget.cluster,
              ),
              Expanded(
                child: MainBody(
                  device: "Web",
                  cluster: widget.cluster,
                ),
              ),
              History(
                device: "Web",
              ),
            ]),
            floatingActionButton: Fab(
              cluster: widget.cluster,
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text('DSC SASTRA University'),
              actions: [
                IconButton(
                    icon: Icon(Icons.history),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => History(
                                device: "Mobile",
                              )));
                    })
              ],
            ),
            body: MainBody(
              device: "Mobile",
              cluster: widget.cluster,
            ),
            drawer: CustomDrawer(
              cluster: widget.cluster,
            ),
          );
        }
      },
    );
  }
}
