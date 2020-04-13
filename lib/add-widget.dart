import 'package:flutter/material.dart';
import 'package:exemplo_brink_offilne_first/db/database.dart';

class AddTodo extends StatelessWidget {

  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adcionar'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value){
                text = value;
            },),
            RaisedButton(
              onPressed: () async {
               await Database.instance.Addtodo(Todo(description: text, completed: false));
                Navigator.pop(context);
              }, child: Text('Salvar'),
              )
          ],
        ),
      ),
      
    );
  }
}