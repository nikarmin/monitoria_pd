import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:monitoria_pd/model/monitor.dart';

class DetailPage extends StatelessWidget {
  final Monitor users;
  DetailPage(this.users); // : users = users, super(key: ObjectKey(users));

  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    var nerd = Emoji('nerd', '🤓');
    var emojiNerd = parser.info('nerd');

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: 'Monitor ', style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: users.nome + " ",
                    style: TextStyle(color: Colors.black)),
                TextSpan(text: '🤓')
              ],
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            //title: Text("Monitor " + users.nome),
          )),
      body: userDetail(),
    );
  }

  userDetail() {
    return Container(
      padding: EdgeInsets.only(top: 80),
      child: ListTile(
        visualDensity: VisualDensity(vertical: 4),
        title: Text(
          users.nome,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        contentPadding: EdgeInsets.all(30),
        subtitle: Text(users.horarios),
        trailing: Text("Curso: " + users.curso,
            style: TextStyle(fontWeight: FontWeight.w500)),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.network(
            users.imagem,
            fit: BoxFit.fill,
            height: 200,
            width: 90,
            //alignment: Alignment.center,
          ),
        ),
      ),
      // )
    );
  }
}
