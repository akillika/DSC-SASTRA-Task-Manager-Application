import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyDialog extends StatefulWidget {
  final String cluster;
  final String name;
  const MyDialog({Key key, this.cluster, this.name}) : super(key: key);
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
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

  final TextEditingController title = new TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              "time": DateTime.now(),
            });
            await FirebaseFirestore.instance.collection('activity').add({
              "action": widget.name +
                  " added a Task - " +
                  title.text +
                  " in " +
                  widget.cluster,
              "type": "Add",
              "time": DateTime.now(),
            });
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
