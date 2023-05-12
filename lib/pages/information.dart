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
      appBar: AppBar(
          title: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: 'Monitor '),
            TextSpan(text: users.nome + " "),
            TextSpan(text: '🤓')
          ],
        ),
      )
          //title: Text("Monitor " + users.nome),
          ),
      body: userDetail(),
    );
  }

  userDetail() {
    return Container(
      padding: EdgeInsets.all(30),
      child: ListTile(
        title: Text(
          users.nome,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(users.horarios),
        trailing: Text("Curso: " + users.curso,
            style: TextStyle(fontWeight: FontWeight.w500)),
        leading: Image.network(
          users.imagem,
          // fit: BoxFit.fill,
          // height: 200,
          // width: 200,
          // alignment: Alignment.center,
        ),
      ),
      // )
    );
  }
}
