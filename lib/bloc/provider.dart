import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:code/item_model.dart';

class Provider {
  static const _db_name = 'xmas_calendar.db';
  static const _db_version = 1;
  static const _table_name = 'surprises';
  static Database _database;
  static const Map<String, String> _columns = {
    'item_id': 'INTEGER PRIMARY KEY',
    'is_opened': 'INTEGER',
    'opened_on': 'INTEGER',
    'surprise_id': 'INTEGER',
  };

  Future<List<ItemModel>> getAllItems() async {
    List<Map<String,dynamic>> result = await _database.query(
      _table_name,
    );
    var toReturn = List<ItemModel>();
    result.forEach((data) => toReturn.add(ItemModel.fromMap(data)));
    return toReturn;
  }

  Future<ItemModel> openItem(int itemId) async {
    List<Map<String,dynamic>> result = await _database.query(
      _table_name,
      columns: _columns.keys.toList(),
      where: 'item_id = ?',
      whereArgs: [itemId],
    );
    return ItemModel.fromMap(result.first);
  }

  Future<void> initDatabase() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentsDirectory.path, _db_name);
    _database = await openDatabase(
      path,
      version: _db_version,
      onCreate: _onCreate,
    );
    print('database opened');
  }

  Future<void> _onCreate(Database db, int version) async {
    var sql = 'CREATE TABLE $_table_name(';
    _columns.forEach((key, value) {
      sql += '$key $value, ';
    });
    sql = sql.substring(0, sql.length - 2);
    sql += ')';
    await db.execute(sql);

    //create rows
    for (var i = 1; i <= 24; i++) {
      Map<String, dynamic> row = Map<String, dynamic>();
      row['item_id'] = i;
      row['is_opened'] = 0;
      await db.insert(_table_name, row);
    }
    print('Database created');
  }
}
