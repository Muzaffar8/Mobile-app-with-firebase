import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/user_state.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
        builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Center(
                  child: Text('App is being initialized'),
                ),
              ),
            ),
          );
        }else if(snapshot.hasError){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Center(
                  child: Text('An error has been occurred'),
                ),
              ),
            ),
          );
        }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Got Job?!',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.blue,
              primarySwatch: Colors.blue,
            ),
            home: UserState(),
          );
        }
    );

  }
}

