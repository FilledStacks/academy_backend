import 'package:get_it/get_it.dart';

import '../data/mongo_database.dart';

Future<GetIt> setupLocator() async {
  final locator = GetIt.asNewInstance();

  final mongoDb = MongoDatabase();
  await mongoDb.initialise();

  locator.registerSingleton(mongoDb);

  return locator;
}
