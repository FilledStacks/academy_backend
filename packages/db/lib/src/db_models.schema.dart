part of 'db_models.dart';

extension DbModelsRepositories on Database {
  DbUserRepository get dbUsers => DbUserRepository._(this);
  DbPurchaseRepository get dbPurchases => DbPurchaseRepository._(this);
  DbProgressRepository get dbProgresses => DbProgressRepository._(this);
  DbChapterProgressRepository get dbChapterProgresses => DbChapterProgressRepository._(this);
  DbCourseRepository get dbCourses => DbCourseRepository._(this);
  DbModuleRepository get dbModules => DbModuleRepository._(this);
  DbChapterRepository get dbChapters => DbChapterRepository._(this);
}

abstract class DbUserRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<DbUserInsertRequest>,
        ModelRepositoryUpdate<DbUserUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory DbUserRepository._(Database db) = _DbUserRepository;

  Future<DbUser?> queryDbUser(int id);
  Future<List<DbUser>> queryDbUsers([QueryParams? params]);
}

class _DbUserRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<DbUserInsertRequest>,
        RepositoryUpdateMixin<DbUserUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements DbUserRepository {
  _DbUserRepository(super.db) : super(tableName: 'db_users', keyName: 'id');

  @override
  Future<DbUser?> queryDbUser(int id) {
    return queryOne(id, DbUserQueryable());
  }

  @override
  Future<List<DbUser>> queryDbUsers([QueryParams? params]) {
    return queryMany(DbUserQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<DbUserInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.query(
      'INSERT INTO "db_users" ( "auth_id", "email", "name", "payment_account_id" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.authId)}:text, ${values.add(r.email)}:text, ${values.add(r.name)}:text, ${values.add(r.paymentAccountId)}:text )').join(', ')}\n'
      'RETURNING "id"',
      values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<DbUserUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "db_users"\n'
      'SET "auth_id" = COALESCE(UPDATED."auth_id", "db_users"."auth_id"), "email" = COALESCE(UPDATED."email", "db_users"."email"), "name" = COALESCE(UPDATED."name", "db_users"."name"), "payment_account_id" = COALESCE(UPDATED."payment_account_id", "db_users"."payment_account_id")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8, ${values.add(r.authId)}:text, ${values.add(r.email)}:text, ${values.add(r.name)}:text, ${values.add(r.paymentAccountId)}:text )').join(', ')} )\n'
      'AS UPDATED("id", "auth_id", "email", "name", "payment_account_id")\n'
      'WHERE "db_users"."id" = UPDATED."id"',
      values.values,
    );
  }
}

abstract class DbPurchaseRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<DbPurchaseInsertRequest>,
        ModelRepositoryUpdate<DbPurchaseUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory DbPurchaseRepository._(Database db) = _DbPurchaseRepository;

  Future<DbPurchase?> queryDbPurchase(int id);
  Future<List<DbPurchase>> queryDbPurchases([QueryParams? params]);
}

class _DbPurchaseRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<DbPurchaseInsertRequest>,
        RepositoryUpdateMixin<DbPurchaseUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements DbPurchaseRepository {
  _DbPurchaseRepository(super.db) : super(tableName: 'db_purchases', keyName: 'id');

  @override
  Future<DbPurchase?> queryDbPurchase(int id) {
    return queryOne(id, DbPurchaseQueryable());
  }

  @override
  Future<List<DbPurchase>> queryDbPurchases([QueryParams? params]) {
    return queryMany(DbPurchaseQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<DbPurchaseInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.query(
      'INSERT INTO "db_purchases" ( "item_id", "date", "course_price", "purchase_price", "purchase_ref", "type", "db_user_id" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.itemId)}:text, ${values.add(r.date)}:timestamp, ${values.add(r.coursePrice)}:int8, ${values.add(r.purchasePrice)}:int8, ${values.add(r.purchaseRef)}:text, ${values.add(r.type)}:int8, ${values.add(r.dbUserId)}:int8 )').join(', ')}\n'
      'RETURNING "id"',
      values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<DbPurchaseUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "db_purchases"\n'
      'SET "item_id" = COALESCE(UPDATED."item_id", "db_purchases"."item_id"), "date" = COALESCE(UPDATED."date", "db_purchases"."date"), "course_price" = COALESCE(UPDATED."course_price", "db_purchases"."course_price"), "purchase_price" = COALESCE(UPDATED."purchase_price", "db_purchases"."purchase_price"), "purchase_ref" = COALESCE(UPDATED."purchase_ref", "db_purchases"."purchase_ref"), "type" = COALESCE(UPDATED."type", "db_purchases"."type"), "db_user_id" = COALESCE(UPDATED."db_user_id", "db_purchases"."db_user_id")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8, ${values.add(r.itemId)}:text, ${values.add(r.date)}:timestamp, ${values.add(r.coursePrice)}:int8, ${values.add(r.purchasePrice)}:int8, ${values.add(r.purchaseRef)}:text, ${values.add(r.type)}:int8, ${values.add(r.dbUserId)}:int8 )').join(', ')} )\n'
      'AS UPDATED("id", "item_id", "date", "course_price", "purchase_price", "purchase_ref", "type", "db_user_id")\n'
      'WHERE "db_purchases"."id" = UPDATED."id"',
      values.values,
    );
  }
}

abstract class DbProgressRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<DbProgressInsertRequest>,
        ModelRepositoryUpdate<DbProgressUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory DbProgressRepository._(Database db) = _DbProgressRepository;

  Future<DbProgress?> queryDbProgress(int id);
  Future<List<DbProgress>> queryDbProgresses([QueryParams? params]);
}

class _DbProgressRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<DbProgressInsertRequest>,
        RepositoryUpdateMixin<DbProgressUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements DbProgressRepository {
  _DbProgressRepository(super.db) : super(tableName: 'db_progresses', keyName: 'id');

  @override
  Future<DbProgress?> queryDbProgress(int id) {
    return queryOne(id, DbProgressQueryable());
  }

  @override
  Future<List<DbProgress>> queryDbProgresses([QueryParams? params]) {
    return queryMany(DbProgressQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<DbProgressInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.query(
      'INSERT INTO "db_progresses" ( "course_id", "user_id", "chapter_progress_id" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.courseId)}:int8, ${values.add(r.userId)}:int8, ${values.add(r.chapterProgressId)}:int8 )').join(', ')}\n'
      'RETURNING "id"',
      values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<DbProgressUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "db_progresses"\n'
      'SET "course_id" = COALESCE(UPDATED."course_id", "db_progresses"."course_id"), "user_id" = COALESCE(UPDATED."user_id", "db_progresses"."user_id"), "chapter_progress_id" = COALESCE(UPDATED."chapter_progress_id", "db_progresses"."chapter_progress_id")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8, ${values.add(r.courseId)}:int8, ${values.add(r.userId)}:int8, ${values.add(r.chapterProgressId)}:int8 )').join(', ')} )\n'
      'AS UPDATED("id", "course_id", "user_id", "chapter_progress_id")\n'
      'WHERE "db_progresses"."id" = UPDATED."id"',
      values.values,
    );
  }
}

abstract class DbChapterProgressRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<DbChapterProgressInsertRequest>,
        ModelRepositoryUpdate<DbChapterProgressUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory DbChapterProgressRepository._(Database db) = _DbChapterProgressRepository;

  Future<DbChapterProgress?> queryDbChapterProgress(int id);
  Future<List<DbChapterProgress>> queryDbChapterProgresses([QueryParams? params]);
}

class _DbChapterProgressRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<DbChapterProgressInsertRequest>,
        RepositoryUpdateMixin<DbChapterProgressUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements DbChapterProgressRepository {
  _DbChapterProgressRepository(super.db) : super(tableName: 'db_chapter_progresses', keyName: 'id');

  @override
  Future<DbChapterProgress?> queryDbChapterProgress(int id) {
    return queryOne(id, DbChapterProgressQueryable());
  }

  @override
  Future<List<DbChapterProgress>> queryDbChapterProgresses([QueryParams? params]) {
    return queryMany(DbChapterProgressQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<DbChapterProgressInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.query(
      'INSERT INTO "db_chapter_progresses" ( "chapter_id", "last_time_stamp", "completed" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.chapterId)}:int8, ${values.add(r.lastTimeStamp)}:int8, ${values.add(r.completed)}:bool )').join(', ')}\n'
      'RETURNING "id"',
      values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<DbChapterProgressUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "db_chapter_progresses"\n'
      'SET "chapter_id" = COALESCE(UPDATED."chapter_id", "db_chapter_progresses"."chapter_id"), "last_time_stamp" = COALESCE(UPDATED."last_time_stamp", "db_chapter_progresses"."last_time_stamp"), "completed" = COALESCE(UPDATED."completed", "db_chapter_progresses"."completed")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8, ${values.add(r.chapterId)}:int8, ${values.add(r.lastTimeStamp)}:int8, ${values.add(r.completed)}:bool )').join(', ')} )\n'
      'AS UPDATED("id", "chapter_id", "last_time_stamp", "completed")\n'
      'WHERE "db_chapter_progresses"."id" = UPDATED."id"',
      values.values,
    );
  }
}

abstract class DbCourseRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<DbCourseInsertRequest>,
        ModelRepositoryUpdate<DbCourseUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory DbCourseRepository._(Database db) = _DbCourseRepository;

  Future<DbCourse?> queryDbCourse(int id);
  Future<List<DbCourse>> queryDbCourses([QueryParams? params]);
}

class _DbCourseRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<DbCourseInsertRequest>,
        RepositoryUpdateMixin<DbCourseUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements DbCourseRepository {
  _DbCourseRepository(super.db) : super(tableName: 'db_courses', keyName: 'id');

  @override
  Future<DbCourse?> queryDbCourse(int id) {
    return queryOne(id, DbCourseQueryable());
  }

  @override
  Future<List<DbCourse>> queryDbCourses([QueryParams? params]) {
    return queryMany(DbCourseQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<DbCourseInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.query(
      'INSERT INTO "db_courses" ( "title", "description", "price", "benefits" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.title)}:text, ${values.add(r.description)}:text, ${values.add(r.price)}:int8, ${values.add(r.benefits)}:_text )').join(', ')}\n'
      'RETURNING "id"',
      values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<DbCourseUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "db_courses"\n'
      'SET "title" = COALESCE(UPDATED."title", "db_courses"."title"), "description" = COALESCE(UPDATED."description", "db_courses"."description"), "price" = COALESCE(UPDATED."price", "db_courses"."price"), "benefits" = COALESCE(UPDATED."benefits", "db_courses"."benefits")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8, ${values.add(r.title)}:text, ${values.add(r.description)}:text, ${values.add(r.price)}:int8, ${values.add(r.benefits)}:_text )').join(', ')} )\n'
      'AS UPDATED("id", "title", "description", "price", "benefits")\n'
      'WHERE "db_courses"."id" = UPDATED."id"',
      values.values,
    );
  }
}

abstract class DbModuleRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<DbModuleInsertRequest>,
        ModelRepositoryUpdate<DbModuleUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory DbModuleRepository._(Database db) = _DbModuleRepository;

  Future<DbModule?> queryDbModule(int id);
  Future<List<DbModule>> queryDbModules([QueryParams? params]);
}

class _DbModuleRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<DbModuleInsertRequest>,
        RepositoryUpdateMixin<DbModuleUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements DbModuleRepository {
  _DbModuleRepository(super.db) : super(tableName: 'db_modules', keyName: 'id');

  @override
  Future<DbModule?> queryDbModule(int id) {
    return queryOne(id, DbModuleQueryable());
  }

  @override
  Future<List<DbModule>> queryDbModules([QueryParams? params]) {
    return queryMany(DbModuleQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<DbModuleInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.query(
      'INSERT INTO "db_modules" ( "title", "price", "db_course_id" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.title)}:text, ${values.add(r.price)}:int8, ${values.add(r.dbCourseId)}:int8 )').join(', ')}\n'
      'RETURNING "id"',
      values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<DbModuleUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "db_modules"\n'
      'SET "title" = COALESCE(UPDATED."title", "db_modules"."title"), "price" = COALESCE(UPDATED."price", "db_modules"."price"), "db_course_id" = COALESCE(UPDATED."db_course_id", "db_modules"."db_course_id")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8, ${values.add(r.title)}:text, ${values.add(r.price)}:int8, ${values.add(r.dbCourseId)}:int8 )').join(', ')} )\n'
      'AS UPDATED("id", "title", "price", "db_course_id")\n'
      'WHERE "db_modules"."id" = UPDATED."id"',
      values.values,
    );
  }
}

abstract class DbChapterRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<DbChapterInsertRequest>,
        ModelRepositoryUpdate<DbChapterUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory DbChapterRepository._(Database db) = _DbChapterRepository;

  Future<DbChapter?> queryDbChapter(int id);
  Future<List<DbChapter>> queryDbChapters([QueryParams? params]);
}

class _DbChapterRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<DbChapterInsertRequest>,
        RepositoryUpdateMixin<DbChapterUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements DbChapterRepository {
  _DbChapterRepository(super.db) : super(tableName: 'db_chapters', keyName: 'id');

  @override
  Future<DbChapter?> queryDbChapter(int id) {
    return queryOne(id, DbChapterQueryable());
  }

  @override
  Future<List<DbChapter>> queryDbChapters([QueryParams? params]) {
    return queryMany(DbChapterQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<DbChapterInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.query(
      'INSERT INTO "db_chapters" ( "title", "description", "video_id", "price", "db_module_id" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.title)}:text, ${values.add(r.description)}:text, ${values.add(r.videoId)}:text, ${values.add(r.price)}:int8, ${values.add(r.dbModuleId)}:int8 )').join(', ')}\n'
      'RETURNING "id"',
      values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<DbChapterUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "db_chapters"\n'
      'SET "title" = COALESCE(UPDATED."title", "db_chapters"."title"), "description" = COALESCE(UPDATED."description", "db_chapters"."description"), "video_id" = COALESCE(UPDATED."video_id", "db_chapters"."video_id"), "price" = COALESCE(UPDATED."price", "db_chapters"."price"), "db_module_id" = COALESCE(UPDATED."db_module_id", "db_chapters"."db_module_id")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8, ${values.add(r.title)}:text, ${values.add(r.description)}:text, ${values.add(r.videoId)}:text, ${values.add(r.price)}:int8, ${values.add(r.dbModuleId)}:int8 )').join(', ')} )\n'
      'AS UPDATED("id", "title", "description", "video_id", "price", "db_module_id")\n'
      'WHERE "db_chapters"."id" = UPDATED."id"',
      values.values,
    );
  }
}

class DbUserInsertRequest {
  DbUserInsertRequest({
    this.authId,
    required this.email,
    required this.name,
    this.paymentAccountId,
  });

  String? authId;
  String email;
  String name;
  String? paymentAccountId;
}

class DbPurchaseInsertRequest {
  DbPurchaseInsertRequest({
    required this.itemId,
    required this.date,
    required this.coursePrice,
    required this.purchasePrice,
    required this.purchaseRef,
    required this.type,
    this.dbUserId,
  });

  String itemId;
  DateTime date;
  int coursePrice;
  int purchasePrice;
  String purchaseRef;
  int type;
  int? dbUserId;
}

class DbProgressInsertRequest {
  DbProgressInsertRequest({
    required this.courseId,
    required this.userId,
    required this.chapterProgressId,
  });

  int courseId;
  int userId;
  int chapterProgressId;
}

class DbChapterProgressInsertRequest {
  DbChapterProgressInsertRequest({
    required this.chapterId,
    required this.lastTimeStamp,
    required this.completed,
  });

  int chapterId;
  int lastTimeStamp;
  bool completed;
}

class DbCourseInsertRequest {
  DbCourseInsertRequest({
    required this.title,
    required this.description,
    required this.price,
    required this.benefits,
  });

  String title;
  String description;
  int price;
  List<String> benefits;
}

class DbModuleInsertRequest {
  DbModuleInsertRequest({
    required this.title,
    required this.price,
    this.dbCourseId,
  });

  String title;
  int price;
  int? dbCourseId;
}

class DbChapterInsertRequest {
  DbChapterInsertRequest({
    required this.title,
    required this.description,
    required this.videoId,
    required this.price,
    this.dbModuleId,
  });

  String title;
  String description;
  String videoId;
  int price;
  int? dbModuleId;
}

class DbUserUpdateRequest {
  DbUserUpdateRequest({
    required this.id,
    this.authId,
    this.email,
    this.name,
    this.paymentAccountId,
  });

  int id;
  String? authId;
  String? email;
  String? name;
  String? paymentAccountId;
}

class DbPurchaseUpdateRequest {
  DbPurchaseUpdateRequest({
    required this.id,
    this.itemId,
    this.date,
    this.coursePrice,
    this.purchasePrice,
    this.purchaseRef,
    this.type,
    this.dbUserId,
  });

  int id;
  String? itemId;
  DateTime? date;
  int? coursePrice;
  int? purchasePrice;
  String? purchaseRef;
  int? type;
  int? dbUserId;
}

class DbProgressUpdateRequest {
  DbProgressUpdateRequest({
    required this.id,
    this.courseId,
    this.userId,
    this.chapterProgressId,
  });

  int id;
  int? courseId;
  int? userId;
  int? chapterProgressId;
}

class DbChapterProgressUpdateRequest {
  DbChapterProgressUpdateRequest({
    required this.id,
    this.chapterId,
    this.lastTimeStamp,
    this.completed,
  });

  int id;
  int? chapterId;
  int? lastTimeStamp;
  bool? completed;
}

class DbCourseUpdateRequest {
  DbCourseUpdateRequest({
    required this.id,
    this.title,
    this.description,
    this.price,
    this.benefits,
  });

  int id;
  String? title;
  String? description;
  int? price;
  List<String>? benefits;
}

class DbModuleUpdateRequest {
  DbModuleUpdateRequest({
    required this.id,
    this.title,
    this.price,
    this.dbCourseId,
  });

  int id;
  String? title;
  int? price;
  int? dbCourseId;
}

class DbChapterUpdateRequest {
  DbChapterUpdateRequest({
    required this.id,
    this.title,
    this.description,
    this.videoId,
    this.price,
    this.dbModuleId,
  });

  int id;
  String? title;
  String? description;
  String? videoId;
  int? price;
  int? dbModuleId;
}

class DbUserQueryable extends KeyedViewQueryable<DbUser, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query =>
      'SELECT "db_users".*, "purchases"."data" as "purchases", "progressEntries"."data" as "progressEntries"'
      'FROM "db_users"'
      'LEFT JOIN ('
      '  SELECT "db_purchases"."db_user_id",'
      '    to_jsonb(array_agg("db_purchases".*)) as data'
      '  FROM (${DbPurchaseQueryable().query}) "db_purchases"'
      '  GROUP BY "db_purchases"."db_user_id"'
      ') "purchases"'
      'ON "db_users"."id" = "purchases"."db_user_id"'
      'LEFT JOIN ('
      '  SELECT "db_progresses"."user_id",'
      '    to_jsonb(array_agg("db_progresses".*)) as data'
      '  FROM (${DbProgressQueryable().query}) "db_progresses"'
      '  GROUP BY "db_progresses"."user_id"'
      ') "progressEntries"'
      'ON "db_users"."id" = "progressEntries"."user_id"';

  @override
  String get tableAlias => 'db_users';

  @override
  DbUser decode(TypedMap map) => DbUserView(
      id: map.get('id'),
      authId: map.getOpt('auth_id'),
      email: map.get('email'),
      name: map.get('name'),
      paymentAccountId: map.getOpt('payment_account_id'),
      purchases: map.getListOpt('purchases', DbPurchaseQueryable().decoder) ?? const [],
      progressEntries:
          map.getListOpt('progressEntries', DbProgressQueryable().decoder) ?? const []);
}

class DbUserView with DbUser {
  DbUserView({
    required this.id,
    this.authId,
    required this.email,
    required this.name,
    this.paymentAccountId,
    required this.purchases,
    required this.progressEntries,
  });

  @override
  final int id;
  @override
  final String? authId;
  @override
  final String email;
  @override
  final String name;
  @override
  final String? paymentAccountId;
  @override
  final List<DbPurchase> purchases;
  @override
  final List<DbProgress> progressEntries;
}

class DbPurchaseQueryable extends KeyedViewQueryable<DbPurchase, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query => 'SELECT "db_purchases".*'
      'FROM "db_purchases"';

  @override
  String get tableAlias => 'db_purchases';

  @override
  DbPurchase decode(TypedMap map) => DbPurchaseView(
      id: map.get('id'),
      itemId: map.get('item_id'),
      date: map.get('date'),
      coursePrice: map.get('course_price'),
      purchasePrice: map.get('purchase_price'),
      purchaseRef: map.get('purchase_ref'),
      type: map.get('type'));
}

class DbPurchaseView with DbPurchase {
  DbPurchaseView({
    required this.id,
    required this.itemId,
    required this.date,
    required this.coursePrice,
    required this.purchasePrice,
    required this.purchaseRef,
    required this.type,
  });

  @override
  final int id;
  @override
  final String itemId;
  @override
  final DateTime date;
  @override
  final int coursePrice;
  @override
  final int purchasePrice;
  @override
  final String purchaseRef;
  @override
  final int type;
}

class DbProgressQueryable extends KeyedViewQueryable<DbProgress, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query =>
      'SELECT "db_progresses".*, row_to_json("course".*) as "course", row_to_json("user".*) as "user", row_to_json("chapterProgress".*) as "chapterProgress"'
      'FROM "db_progresses"'
      'LEFT JOIN (${DbCourseQueryable().query}) "course"'
      'ON "db_progresses"."course_id" = "course"."id"'
      'LEFT JOIN (${DbUserQueryable().query}) "user"'
      'ON "db_progresses"."user_id" = "user"."id"'
      'LEFT JOIN (${DbChapterProgressQueryable().query}) "chapterProgress"'
      'ON "db_progresses"."chapter_progress_id" = "chapterProgress"."id"';

  @override
  String get tableAlias => 'db_progresses';

  @override
  DbProgress decode(TypedMap map) => DbProgressView(
      id: map.get('id'),
      course: map.get('course', DbCourseQueryable().decoder),
      user: map.get('user', DbUserQueryable().decoder),
      chapterProgress: map.get('chapterProgress', DbChapterProgressQueryable().decoder));
}

class DbProgressView with DbProgress {
  DbProgressView({
    required this.id,
    required this.course,
    required this.user,
    required this.chapterProgress,
  });

  @override
  final int id;
  @override
  final DbCourse course;
  @override
  final DbUser user;
  @override
  final DbChapterProgress chapterProgress;
}

class DbChapterProgressQueryable extends KeyedViewQueryable<DbChapterProgress, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query => 'SELECT "db_chapter_progresses".*, row_to_json("chapter".*) as "chapter"'
      'FROM "db_chapter_progresses"'
      'LEFT JOIN (${DbChapterQueryable().query}) "chapter"'
      'ON "db_chapter_progresses"."chapter_id" = "chapter"."id"';

  @override
  String get tableAlias => 'db_chapter_progresses';

  @override
  DbChapterProgress decode(TypedMap map) => DbChapterProgressView(
      id: map.get('id'),
      chapter: map.get('chapter', DbChapterQueryable().decoder),
      lastTimeStamp: map.get('last_time_stamp'),
      completed: map.get('completed'));
}

class DbChapterProgressView with DbChapterProgress {
  DbChapterProgressView({
    required this.id,
    required this.chapter,
    required this.lastTimeStamp,
    required this.completed,
  });

  @override
  final int id;
  @override
  final DbChapter chapter;
  @override
  final int lastTimeStamp;
  @override
  final bool completed;
}

class DbCourseQueryable extends KeyedViewQueryable<DbCourse, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query => 'SELECT "db_courses".*, "modules"."data" as "modules"'
      'FROM "db_courses"'
      'LEFT JOIN ('
      '  SELECT "db_modules"."db_course_id",'
      '    to_jsonb(array_agg("db_modules".*)) as data'
      '  FROM (${DbModuleQueryable().query}) "db_modules"'
      '  GROUP BY "db_modules"."db_course_id"'
      ') "modules"'
      'ON "db_courses"."id" = "modules"."db_course_id"';

  @override
  String get tableAlias => 'db_courses';

  @override
  DbCourse decode(TypedMap map) => DbCourseView(
      id: map.get('id'),
      title: map.get('title'),
      description: map.get('description'),
      price: map.get('price'),
      benefits: map.getListOpt('benefits') ?? const [],
      modules: map.getListOpt('modules', DbModuleQueryable().decoder) ?? const []);
}

class DbCourseView with DbCourse {
  DbCourseView({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.benefits,
    required this.modules,
  });

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final int price;
  @override
  final List<String> benefits;
  @override
  final List<DbModule> modules;
}

class DbModuleQueryable extends KeyedViewQueryable<DbModule, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query => 'SELECT "db_modules".*, "chapters"."data" as "chapters"'
      'FROM "db_modules"'
      'LEFT JOIN ('
      '  SELECT "db_chapters"."db_module_id",'
      '    to_jsonb(array_agg("db_chapters".*)) as data'
      '  FROM (${DbChapterQueryable().query}) "db_chapters"'
      '  GROUP BY "db_chapters"."db_module_id"'
      ') "chapters"'
      'ON "db_modules"."id" = "chapters"."db_module_id"';

  @override
  String get tableAlias => 'db_modules';

  @override
  DbModule decode(TypedMap map) => DbModuleView(
      id: map.get('id'),
      title: map.get('title'),
      price: map.get('price'),
      chapters: map.getListOpt('chapters', DbChapterQueryable().decoder) ?? const []);
}

class DbModuleView with DbModule {
  DbModuleView({
    required this.id,
    required this.title,
    required this.price,
    required this.chapters,
  });

  @override
  final int id;
  @override
  final String title;
  @override
  final int price;
  @override
  final List<DbChapter> chapters;
}

class DbChapterQueryable extends KeyedViewQueryable<DbChapter, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query => 'SELECT "db_chapters".*'
      'FROM "db_chapters"';

  @override
  String get tableAlias => 'db_chapters';

  @override
  DbChapter decode(TypedMap map) => DbChapterView(
      id: map.get('id'),
      title: map.get('title'),
      description: map.get('description'),
      videoId: map.get('video_id'),
      price: map.get('price'));
}

class DbChapterView with DbChapter {
  DbChapterView({
    required this.id,
    required this.title,
    required this.description,
    required this.videoId,
    required this.price,
  });

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String videoId;
  @override
  final int price;
}
