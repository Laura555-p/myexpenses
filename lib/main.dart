import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/user_transaction.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo[200],
        primarySwatch: Colors.grey,
        accentColor: Color.fromRGBO(150, 150, 210, 5),
        cursorColor:Color.fromRGBO(150, 150, 210, 5),
        brightness: Brightness.light,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline: TextStyle(
                fontFamily: 'Gelasio',
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
              title: TextStyle(
                fontFamily: 'Gelasio',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              subtitle: TextStyle(
                fontFamily: 'Gelasio',
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: Colors.grey,
              ),

              button: TextStyle(
                fontFamily: 'Gelasio',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(150, 150, 210, 5),
              ),
          overline:  TextStyle(
            fontFamily: 'Gelasio',
            fontSize: 15,
          ),
            ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            fontFamily: 'Gelasio',
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(150, 150, 210, 5),
          ),
        ),
        iconTheme: IconThemeData(
          color: Color.fromRGBO(150, 150, 210, 5),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10, top: 45, right: 10, bottom: 0),
          child: Column(
            children: <Widget>[
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
