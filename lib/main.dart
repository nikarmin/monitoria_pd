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
      title: 'Horários MONITORIA DPD',
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
          title: Text("MONITORIA DPD"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                users[index].nome,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              subtitle: Text(users[index].email),
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
