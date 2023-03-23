import 'package:db/db.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class User with _$User implements DbUserView {
  factory User({
    required int id,
    required String name,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromDb(DbUser dbUser) {
    return User(
      id: dbUser.id,
      name: dbUser.name,
    );
  }

  @override
  String toString() {
    return '$id $name';
  }
}
