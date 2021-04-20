import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('DSC SASTRA University'),
      ),
      body: Row(children: <Widget>[
        SideLayout(),
        Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: Colors.white,
                    child: InkWell(
                      splashColor: Colors.blue,
                      onTap: () {
                        print('Card tapped.');
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(child: Text('Poda venna')),
                      ),
                    ),
                  )
                ],
              ),
            ))
      ]),
      floatingActionButton: FloatingActionButton(
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
            color: Colors.blueGrey,
            //   topLeft: Radius.circular(40.0),
            // bottomLeft: Radius.circular(40.0)
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 70),
              Image.asset('assets/images/logo.png'),
              ListTile(
                title: Text(
                  'Android',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'AR/VR',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Cyber Security',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Design',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Flutter',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Machine Learning',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Google Cloud',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Content Writing',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Event coverage',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Web',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
