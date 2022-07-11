import 'package:flutter_app/model/CardModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  static final String cardtable = 'cardtable';
  static String namecol = 'name';
  static String pricecol = 'price';
  static String quntitycol = 'quntity';
  static String imagecol = 'image';

  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initialDb();
      return _database;
      print("++++++++++++++++++++++++++++++++++");
    } else {
      return _database;
    }
  }

  initialDb() async {
    String Dbpath = await getDatabasesPath();
    String path = join(Dbpath, 'Carddb');
    Database db = await openDatabase(path, onCreate: onCreate, version: 1);
    return db;
  }

  onCreate(Database db, int v) {
    db.execute('''
  create table $cardtable(
    id INTEGER AUTOINCREAMENT NOT NULL PRIMARY KEY,
    $namecol TEXT NOT NULL,
     $pricecol TEXT NOT NULL,
      $quntitycol TEXT NOT NULL,
      $imagecol TEXT NOT NULL




  )

''');
  }

  insertdata(String sql) async {
    Database? db = await database;
    try {
      db?.rawInsert(sql);
    } catch (e) {}
  }
}
