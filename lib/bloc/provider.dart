import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

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

  Provider() {
    if (_database == null) {
      _initDatabase();
    }
  }

  Future<void> _initDatabase() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentsDirectory.path, _db_name);
    return await openDatabase(
      path,
      version: _db_version,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    var sql = 'CREATE TABLE $_table_name(';
    _columns.forEach((key,value) {
      sql += '$key $value, ';
    });
    sql = sql.substring(0,sql.length - 2);
    sql += ')';
    await db.execute(sql);

    //create rows
    for(var i=1;i<=24;i++) {
      Map<String,dynamic> row = Map<String,dynamic>();
      row['item_id'] = i;
      row['is_opened'] = 0;
      await db.insert(_table_name,row);
    }
    print('Database created');
  }
}
