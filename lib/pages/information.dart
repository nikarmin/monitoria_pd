import 'package:flutter/material.dart';
import 'package:monitoria_pd/model/monitor.dart';

class DetailPage extends StatelessWidget {
  final Monitor users;
  DetailPage(this.users); // : users = users, super(key: ObjectKey(users));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 177, 41, 63),
        title: Text('Monitor ' + users.nome,
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
      ),
      body: userDetail(),
    );
  }

  userDetail() {
    return Container(
      padding: EdgeInsets.all(30),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(22, 0, 0, 0),
                    blurRadius: 10,
                    offset: Offset(4, 8))
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  users.imagem,
                  fit: BoxFit.fill,
                  height: 200,
                  width: 200,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                users.nome,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  letterSpacing: 1.0,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Curso: " + users.curso,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Horários:",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                users.horarios,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      // child: ListTile(
      //   title: Text(
      //     users.nome,
      //     style: TextStyle(fontWeight: FontWeight.w400),
      //   ),
      //   subtitle: Text(users.horarios),
      //   trailing: Text("Curso: " + users.curso,
      //       style: TextStyle(fontWeight: FontWeight.w500)),
      //   leading: Image.network(
      //     users.imagem,
      //     // fit: BoxFit.fill,
      //     // height: 200,
      //     // width: 200,
      //     // alignment: Alignment.center,
      //   ),
      // ),
      // )
    );
  }
}
