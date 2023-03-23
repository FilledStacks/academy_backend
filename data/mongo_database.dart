import 'package:mongo_dart/mongo_dart.dart';

/// The connection and type safe interfact of the mongo database
class MongoDatabase {
  final db = Db('mongodb://localhost:27017/test');

  Future<void> initialise() async {
    print('MongoDatabase initialise');
    await db.open();
  }

  Future<List<Map<String, dynamic>>> getStuff() async {
    final people = await db.collection('people').find().toList();
    return people;
  }
}
