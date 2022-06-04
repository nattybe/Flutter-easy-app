// ignore_for_file: unnecessary_this, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    return _HomeState();
  }
}

// ignore: duplicate_ignore, duplicate_ignore
class _HomeState extends State<Home> {
  var temp;
  var discription;
  var currently;
  var humudity;
  // ignore: prefer_typing_uninitialized_variables
  var windspeed;

  Future getWheather() async {
    // ignore: unused_local_variable
    http.Response response = await http.get(
        "https://api.openweathermap.org/data/2.5/weather?q=Addis%20Ababa&appid=52321e912f45bad5824de290bd1a0647");
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.discription = results['wheather'][0][' discription'];
      this.currently = results['main'][0]['currently'];
      this.humudity = results['wheather']['humudity'];
      this.windspeed = results['main']['speed'];
    });
  }

  @override
  void initState() {
    super.initState();
    // ignore: unnecessary_this
    this.getWheather();
  }

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
          child: Column(children: <Widget>[
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
              // ignore: prefer_interpolation_to_compose_strings
              temp != null ? temp.toString() + "\u00B0" : "loading",
              style: TextStyle(
                  color: Color.fromARGB(255, 54, 53, 53),
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                currently != null ? currently.toString() : "Loading",
                style: TextStyle(
                    color: Color.fromARGB(255, 85, 15, 15),
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
            children: <Widget>[
              ListTile(
                // ignore: deprecated_member_use
                leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                title: Text("Temprature"),
                // ignore: prefer_interpolation_to_compose_strings
                trailing:
                    Text(temp != null ? temp.toString() + "\u00B0" : "Loading"),
              ),
              ListTile(
                // ignore: deprecated_member_use
                leading: FaIcon(FontAwesomeIcons.cloud),
                title: Text("wheather"),
                trailing: Text(
                    discription != null ? discription.toString() : "Loading"),
              ),
              ListTile(
                // ignore: deprecated_member_use
                leading: FaIcon(FontAwesomeIcons.sun),
                title: Text("humudity"),
                trailing:
                    Text(humudity != null ? humudity.toString() : "Loading"),
              ),
              ListTile(
                // ignore: deprecated_member_use
                leading: FaIcon(FontAwesomeIcons.wind),
                title: Text("wind speed"),
                trailing:
                    Text(windspeed != null ? windspeed.toString() : "Loading"),
              ),
            ],
          ),
        ))
      ],
    ));
  }
}
