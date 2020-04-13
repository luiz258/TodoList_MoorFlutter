import 'package:exemplo_brink_offilne_first/add-widget.dart';
import 'package:exemplo_brink_offilne_first/db/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {

      //Database.instance.Addtodo(Todo(completed: false, description: "teste 1"));

    return Scaffold(
      appBar: AppBar(title: Text('Sqlite'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add), onPressed:() {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddTodo()));
        
      }),
      
      ],
      ),
      body: StreamBuilder<List<Todo>>(
        stream: Database.instance.getAllTodos(),
        builder: (context, snapshot){

          List<Todo> list =snapshot.data;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context,index){
              return ListTile( 
                leading: IconButton(icon: Icon(Icons.delete), onPressed: () {
                  Database.instance.deleteTodo(list[index].id);
                }),
                title: Text(list[index].description
                
                ),
              );
            },
          );
        }),
    );
  }
}