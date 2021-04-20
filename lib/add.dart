import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  bool check=false;
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
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                  children: <Widget>[
                    Card(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          print('Card tapped.');
                        },
                        child:  SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: this.check,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.check = value;
                                    });
                                  },
                                ),
                                SizedBox(width: 15,),
                                Text('DSC Articles submission',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 15,),
                                Text('Posted on: 15th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                                SizedBox(width: 15,),
                                Text('Due on: 17th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          print('Card tapped.');
                        },
                        child:  SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: this.check,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.check = value;
                                    });
                                  },
                                ),
                                SizedBox(width: 15,),
                                Text('DSC Articles submission',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 15,),
                                Text('Posted on: 15th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                                SizedBox(width: 15,),
                                Text('Due on: 17th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),Card(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          print('Card tapped.');
                        },
                        child:  SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: this.check,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.check = value;
                                    });
                                  },
                                ),
                                SizedBox(width: 15,),
                                Text('DSC Articles submission',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 15,),
                                Text('Posted on: 15th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                                SizedBox(width: 15,),
                                Text('Due on: 17th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),Card(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          print('Card tapped.');
                        },
                        child:  SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: this.check,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.check = value;
                                    });
                                  },
                                ),
                                SizedBox(width: 15,),
                                Text('DSC Articles submission',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 15,),
                                Text('Posted on: 15th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                                SizedBox(width: 15,),
                                Text('Due on: 17th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),Card(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          print('Card tapped.');
                        },
                        child:  SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: this.check,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.check = value;
                                    });
                                  },
                                ),
                                SizedBox(width: 15,),
                                Text('DSC Articles submission',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 15,),
                                Text('Posted on: 15th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                                SizedBox(width: 15,),
                                Text('Due on: 17th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),Card(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          print('Card tapped.');
                        },
                        child:  SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: this.check,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.check = value;
                                    });
                                  },
                                ),
                                SizedBox(width: 15,),
                                Text('DSC Articles submission',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 15,),
                                Text('Posted on: 15th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                                SizedBox(width: 15,),
                                Text('Due on: 17th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),Card(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          print('Card tapped.');
                        },
                        child:  SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: this.check,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.check = value;
                                    });
                                  },
                                ),
                                SizedBox(width: 15,),
                                Text('DSC Articles submission',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 15,),
                                Text('Posted on: 15th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                                SizedBox(width: 15,),
                                Text('Due on: 17th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),Card(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          print('Card tapped.');
                        },
                        child:  SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: this.check,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.check = value;
                                    });
                                  },
                                ),
                                SizedBox(width: 15,),
                                Text('DSC Articles submission',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 15,),
                                Text('Posted on: 15th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                                SizedBox(width: 15,),
                                Text('Due on: 17th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),Card(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          print('Card tapped.');
                        },
                        child:  SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: this.check,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.check = value;
                                    });
                                  },
                                ),
                                SizedBox(width: 15,),
                                Text('DSC Articles submission',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 15,),
                                Text('Posted on: 15th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                                SizedBox(width: 15,),
                                Text('Due on: 17th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),Card(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          print('Card tapped.');
                        },
                        child:  SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: this.check,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.check = value;
                                    });
                                  },
                                ),
                                SizedBox(width: 15,),
                                Text('DSC Articles submission',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 15,),
                                Text('Posted on: 15th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                                SizedBox(width: 15,),
                                Text('Due on: 17th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),Card(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          print('Card tapped.');
                        },
                        child:  SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: this.check,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.check = value;
                                    });
                                  },
                                ),
                                SizedBox(width: 15,),
                                Text('DSC Articles submission',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 15,),
                                Text('Posted on: 15th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                                SizedBox(width: 15,),
                                Text('Due on: 17th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),Card(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          print('Card tapped.');
                        },
                        child:  SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: this.check,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.check = value;
                                    });
                                  },
                                ),
                                SizedBox(width: 15,),
                                Text('DSC Articles submission',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 15,),
                                Text('Posted on: 15th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                                SizedBox(width: 15,),
                                Text('Due on: 17th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),Card(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          print('Card tapped.');
                        },
                        child:  SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: this.check,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.check = value;
                                    });
                                  },
                                ),
                                SizedBox(width: 15,),
                                Text('DSC Articles submission',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 15,),
                                Text('Posted on: 15th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                                SizedBox(width: 15,),
                                Text('Due on: 17th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),Card(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          print('Card tapped.');
                        },
                        child:  SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: this.check,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.check = value;
                                    });
                                  },
                                ),
                                SizedBox(width: 15,),
                                Text('DSC Articles submission',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 15,),
                                Text('Posted on: 15th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                                SizedBox(width: 15,),
                                Text('Due on: 17th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),Card(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          print('Card tapped.');
                        },
                        child:  SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: this.check,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.check = value;
                                    });
                                  },
                                ),
                                SizedBox(width: 15,),
                                Text('DSC Articles submission',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 15,),
                                Text('Posted on: 15th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                                SizedBox(width: 15,),
                                Text('Due on: 17th April 2020',style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),


                  ]
              )


            ))
      ]),
      floatingActionButton: FloatingActionButton(
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
