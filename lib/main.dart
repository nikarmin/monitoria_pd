import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Monitoria de Processamento de Dados",
          style: GoogleFonts.poppins(
              letterSpacing: 1.5, fontSize: 30, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      body: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
        child: ListView.builder(
          padding: EdgeInsets.only(top: 80),
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                users[index].nome,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              subtitle: Text("Email: " + users[index].email),
              leading: Icon(
                Icons.person_outlined,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailPage(users[index]);
                }));
              },
            );
          },
        ),
      ),
    );
  }
}
