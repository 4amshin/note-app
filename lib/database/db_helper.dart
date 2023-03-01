import 'package:note_app/model/note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  //old db = note.db, note1.db
  final String dbName = 'note2.db';
  final int dbVersion = 1;

  //*Note Table
  final String? tableName = 'note';
  final String? id = 'id';
  final String? title = 'title';
  final String? content = 'content';
  final String? color = 'color';
  final String? createdAt = 'createdAt';
  final String? updatedAt = 'updatedAt';

  Database? _database;

  //*Connect to Db
  Future<Database> database() async {
    if (_database != null) return _database!;

    _database = await _initDB(dbName);
    return _database!;
  }

  //*Initialize db
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: dbVersion,
      onCreate: _createDb,
    );
  }

  //*Create db & table
  Future _createDb(Database db, int version) async {
    const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const String textType = 'TEXT NULL';

    await db.execute(
      '''
      CREATE TABLE $tableName (
        $id $idType , 
        $title $textType, 
        $content $textType, 
        $color $textType, 
        $createdAt $textType, 
        $updatedAt $textType
        )
      ''',
    );
  }

  //*Read data from table database
  Future<List<NoteModel>> displayDb() async {
    final data = await _database!.query(tableName!);

    List<NoteModel> result = data.map((e) => NoteModel.fromJson(e)).toList();

    print(result);
    return result;
  }

  //*Create or Insert data into table database
  Future<int> insertData(Map<String, dynamic> row) async {
    final query = await _database!.insert(tableName!, row);
    return query;
  }

  //*Update data into table database
  Future<int> updateData(int idParam, Map<String, dynamic> row) async {
    final query = await _database!.update(
      tableName!,
      row,
      where: '$id = ?',
      whereArgs: [idParam],
    );
    return query;
  }

  //*Delete data from table database
  Future deleteData(int idParam) async {
    await _database!.delete(
      tableName!,
      where: '$id  = ?',
      whereArgs: [idParam],
    );
  }
}
