import 'package:flutter/material.dart';
import 'package:monitoria_pd/model/monitor.dart';

class DetailPage extends StatelessWidget {
  final Monitor users;
  DetailPage(this.users); // : users = users, super(key: ObjectKey(users));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(users.nome),
      ),
      body: userDetail(),
    );
  }

  userDetail() {
    return Container(
      padding: EdgeInsets.all(32),
      child: ListTile(
        title: Text(
          users.nome,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(users.horarios),
        trailing: Text(users.horarios),
        leading: Image.network(
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.moneytimes.com.br%2Fminions-2-a-origem-de-gru-dispara-em-bilheteria-nos-eua-neste-fim-de-semana%2F&psig=AOvVaw175YhpxrwyXrhHrzElKqYK&ust=1683988766272000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCMD7n5OB8P4CFQAAAAAdAAAAABAD'),
      ),
    );
  }
}
