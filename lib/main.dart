import 'package:dsc_todo/signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialisation = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialisation,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  title: Text('Error'),
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'DSC SASTRA University',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                fontFamily: 'GoogleSans',
              ),
              home: SignInPage(),
            );
          }
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: Text('Loading'),
              ),
            ),
          );
        });
  }
}
