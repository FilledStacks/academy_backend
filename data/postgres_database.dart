import 'package:db/db.dart';
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

/// The connection and type safe interfact of the mongo database
class MongoDatabase {
  final db = Database(
    host: '127.0.0.1',
    port: 5432,
    database: 'postgres',
    user: 'postgres',
    password: 'changeme',
    useSSL: false,
  );

  Future<void> initialise() async {
    print('MongoDatabase initialise');
    await db.open();
  }

  Future<List<User>> getStuff() async {
    final people = await db.dbUsers.queryDbUser(1);

    if (people != null) {
      return [User.fromDb(people)];
    }

    return [];
  }
}
