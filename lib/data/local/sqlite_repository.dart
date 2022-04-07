import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_sqlite/core/constants/sql_name.dart';
import 'package:test_sqlite/data/models/user.dart';

class SqliteRepository {
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }

  Future<Database?> initDatabase() async {
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, SqlName.databaseName);

    var exists = await databaseExists(path);

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE user (id INTEGER IDENTITY(1,1) PRIMARY KEY, ${SqlName.columnFirstName} TEXT, ${SqlName.columnLastName} TEXT, ${SqlName.columnPhone} TEXT, ${SqlName.columnEmail} TEXT, ${SqlName.columnAvatar} TEXT)');
    });

    return database;
  }

  Future<List<User>> getListUser() async {
    try {
      final Database? db = await database;
      final List<Map<String, Object?>>? listQuery =
          await db?.query(SqlName.tableUser);
      final List<User> listUser = <User>[];
      listQuery?.forEach((element) {
        listUser.add(User.fromMap(element));
      });
      return listUser;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> insertUser(Map<String, dynamic> mapUser) async {
    final Database? db = await database;
    await db?.insert(SqlName.tableUser, mapUser);
  }
}
