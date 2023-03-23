part of 'db_models.dart';

extension DbModelsRepositories on Database {
  DbUserRepository get dbUsers => DbUserRepository._(this);
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
      'INSERT INTO "db_users" ( "name" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.name)}:text )').join(', ')}\n'
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
      'SET "name" = COALESCE(UPDATED."name", "db_users"."name")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8, ${values.add(r.name)}:text )').join(', ')} )\n'
      'AS UPDATED("id", "name")\n'
      'WHERE "db_users"."id" = UPDATED."id"',
      values.values,
    );
  }
}

class DbUserInsertRequest {
  DbUserInsertRequest({
    required this.name,
  });

  String name;
}

class DbUserUpdateRequest {
  DbUserUpdateRequest({
    required this.id,
    this.name,
  });

  int id;
  String? name;
}

class DbUserQueryable extends KeyedViewQueryable<DbUser, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query => 'SELECT "db_users".*'
      'FROM "db_users"';

  @override
  String get tableAlias => 'db_users';

  @override
  DbUser decode(TypedMap map) => DbUserView(id: map.get('id'), name: map.get('name'));
}

class DbUserView with DbUser {
  DbUserView({
    required this.id,
    required this.name,
  });

  @override
  final int id;
  @override
  final String name;
}
