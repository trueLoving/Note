import 'package:sqflite/sqflite.dart';
import 'package:note/model/note.dart';

class DB {
  var db;

  DB() {
    open();
  }

  open() async {
    var databasePath = await getDatabasesPath();
    String path = databasePath + "note.db";
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
         CREATE TABLE Note (
            id INTEGER PRIMARY KEY, 
            title TEXT, 
            content TEXT, 
            createTime TEXT, 
            isDone INT)
        ''');
    });
  }

  Future<Note> insert(Note note) async {
    note.id = await db.insert();
    return note;
  }

  Future<int> delete(int id) async {
    return await db.delete('Note', where: 'id=?', whereArgs: [id]);
  }

  Future<int> update(Note note) async {
    return await db
        .update('Note', note.toMap(), where: 'id=?', whereArgs: [note.id]);
  }

  Future<List<Note>> queryAll() async {
    List<Map> maps = await db.query('Note',
        columns: ['id', 'title', 'content', 'createTime', 'isDone']);
    if (maps == null || maps.length == 0) {
      return null;
    }
    List<Note> notes = [];
    for (int i = 0; i < maps.length; i++) {
      notes.add(Note.fromMap(maps[i]));
    }
    return notes;
  }
}
