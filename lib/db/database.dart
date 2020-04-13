import 'package:moor_flutter/moor_flutter.dart';
part 'database.g.dart';

class Todos extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text().withLength(min: 3, max: 40)();
  BoolColumn get completed => boolean()();
}
class Favorites extends Table{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idTodo => integer().nullable()();
}

@UseMoor(tables: [Todos, Favorites])
class Database extends _$Database {

  static final Database instance  = Database._internal();
    Database._internal():
          super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

    Stream<List<Todo>> getAllTodos(){
      return select(todos).watch();
    }

    Addtodo(Todo todo){
      return into(todos).insert(todo);
    }

    Future deleteTodo(int id){
      return (delete(todos)..where((todo) => todo.id.equals(id))).go();
    }
  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;
}