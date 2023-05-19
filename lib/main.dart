import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:monitoria_pd/api/api_connect.dart';

import 'model/monitor.dart';
import 'pages/information.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(Object context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Horários Monitoria',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: BuildListView(),
    );
  }
}

class BuildListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BuildListViewState();
}

class _BuildListViewState extends State {
  List<Monitor> users = <Monitor>[];

  _getUsers() {
    API.getMonitores().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => Monitor.fromJson(model)).toList();
      });
    });
  }

  @override
  initState() {
    super.initState();

    _getUsers();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Horários monitoria',
              style: TextStyle(
                  fontSize: 25,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                        blurRadius: 10.0,
                        // color of the shadow
                        color: Color.fromARGB(193, 0, 0, 0)),
                    // color and font size of the text
                  ])),
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 177, 41, 63),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.all(5),
              leading: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              ),
              title: Text(
                users[index].nome,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              subtitle: Text("Email: " + users[index].email),
              hoverColor: Color.fromARGB(15, 177, 41, 64),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailPage(users[index]);
                }));
              },
            );
          },
        ));
  }
}
