import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Wheather app",
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 20, 173, 219),
          child: Column(children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                "currently in Addis Abeba",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              "52\u00B0",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "rain",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ]),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: const <Widget>[
              ListTile(
                // ignore: deprecated_member_use
                leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                title: Text("Temprature"),
                trailing: Text("52\u00B0"),
              ),
            ],
          ),
        ))
      ],
    ));
  }
}
