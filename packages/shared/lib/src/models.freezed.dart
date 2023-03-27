// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String? get authId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// The Id of the users payment account
  String? get paymentAccountId => throw _privateConstructorUsedError;
  List<Purchase> get purchases => throw _privateConstructorUsedError;
  List<Progress> get progressEntries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String? authId,
      String email,
      String name,
      String? paymentAccountId,
      List<Purchase> purchases,
      List<Progress> progressEntries});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authId = freezed,
    Object? email = null,
    Object? name = null,
    Object? paymentAccountId = freezed,
    Object? purchases = null,
    Object? progressEntries = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      authId: freezed == authId
          ? _value.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      paymentAccountId: freezed == paymentAccountId
          ? _value.paymentAccountId
          : paymentAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      purchases: null == purchases
          ? _value.purchases
          : purchases // ignore: cast_nullable_to_non_nullable
              as List<Purchase>,
      progressEntries: null == progressEntries
          ? _value.progressEntries
          : progressEntries // ignore: cast_nullable_to_non_nullable
              as List<Progress>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? authId,
      String email,
      String name,
      String? paymentAccountId,
      List<Purchase> purchases,
      List<Progress> progressEntries});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authId = freezed,
    Object? email = null,
    Object? name = null,
    Object? paymentAccountId = freezed,
    Object? purchases = null,
    Object? progressEntries = null,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      authId: freezed == authId
          ? _value.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      paymentAccountId: freezed == paymentAccountId
          ? _value.paymentAccountId
          : paymentAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      purchases: null == purchases
          ? _value._purchases
          : purchases // ignore: cast_nullable_to_non_nullable
              as List<Purchase>,
      progressEntries: null == progressEntries
          ? _value._progressEntries
          : progressEntries // ignore: cast_nullable_to_non_nullable
              as List<Progress>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User(
      {required this.id,
      this.authId,
      required this.email,
      required this.name,
      this.paymentAccountId,
      final List<Purchase> purchases = const [],
      final List<Progress> progressEntries = const []})
      : _purchases = purchases,
        _progressEntries = progressEntries;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final int id;
  @override
  final String? authId;
  @override
  final String email;
  @override
  final String name;

  /// The Id of the users payment account
  @override
  final String? paymentAccountId;
  final List<Purchase> _purchases;
  @override
  @JsonKey()
  List<Purchase> get purchases {
    if (_purchases is EqualUnmodifiableListView) return _purchases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_purchases);
  }

  final List<Progress> _progressEntries;
  @override
  @JsonKey()
  List<Progress> get progressEntries {
    if (_progressEntries is EqualUnmodifiableListView) return _progressEntries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_progressEntries);
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authId, authId) || other.authId == authId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.paymentAccountId, paymentAccountId) ||
                other.paymentAccountId == paymentAccountId) &&
            const DeepCollectionEquality()
                .equals(other._purchases, _purchases) &&
            const DeepCollectionEquality()
                .equals(other._progressEntries, _progressEntries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      authId,
      email,
      name,
      paymentAccountId,
      const DeepCollectionEquality().hash(_purchases),
      const DeepCollectionEquality().hash(_progressEntries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {required final int id,
      final String? authId,
      required final String email,
      required final String name,
      final String? paymentAccountId,
      final List<Purchase> purchases,
      final List<Progress> progressEntries}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int get id;
  @override
  String? get authId;
  @override
  String get email;
  @override
  String get name;
  @override

  /// The Id of the users payment account
  String? get paymentAccountId;
  @override
  List<Purchase> get purchases;
  @override
  List<Progress> get progressEntries;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

Purchase _$PurchaseFromJson(Map<String, dynamic> json) {
  return _Purchase.fromJson(json);
}

/// @nodoc
mixin _$Purchase {
  int get id => throw _privateConstructorUsedError;
  String get itemId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get coursePrice => throw _privateConstructorUsedError;
  int get purchasePrice => throw _privateConstructorUsedError;
  String get purchaseRef => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseCopyWith<Purchase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseCopyWith<$Res> {
  factory $PurchaseCopyWith(Purchase value, $Res Function(Purchase) then) =
      _$PurchaseCopyWithImpl<$Res, Purchase>;
  @useResult
  $Res call(
      {int id,
      String itemId,
      DateTime date,
      int coursePrice,
      int purchasePrice,
      String purchaseRef,
      int type});
}

/// @nodoc
class _$PurchaseCopyWithImpl<$Res, $Val extends Purchase>
    implements $PurchaseCopyWith<$Res> {
  _$PurchaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? date = null,
    Object? coursePrice = null,
    Object? purchasePrice = null,
    Object? purchaseRef = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      coursePrice: null == coursePrice
          ? _value.coursePrice
          : coursePrice // ignore: cast_nullable_to_non_nullable
              as int,
      purchasePrice: null == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseRef: null == purchaseRef
          ? _value.purchaseRef
          : purchaseRef // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PurchaseCopyWith<$Res> implements $PurchaseCopyWith<$Res> {
  factory _$$_PurchaseCopyWith(
          _$_Purchase value, $Res Function(_$_Purchase) then) =
      __$$_PurchaseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String itemId,
      DateTime date,
      int coursePrice,
      int purchasePrice,
      String purchaseRef,
      int type});
}

/// @nodoc
class __$$_PurchaseCopyWithImpl<$Res>
    extends _$PurchaseCopyWithImpl<$Res, _$_Purchase>
    implements _$$_PurchaseCopyWith<$Res> {
  __$$_PurchaseCopyWithImpl(
      _$_Purchase _value, $Res Function(_$_Purchase) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? date = null,
    Object? coursePrice = null,
    Object? purchasePrice = null,
    Object? purchaseRef = null,
    Object? type = null,
  }) {
    return _then(_$_Purchase(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      coursePrice: null == coursePrice
          ? _value.coursePrice
          : coursePrice // ignore: cast_nullable_to_non_nullable
              as int,
      purchasePrice: null == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseRef: null == purchaseRef
          ? _value.purchaseRef
          : purchaseRef // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Purchase implements _Purchase {
  _$_Purchase(
      {required this.id,
      required this.itemId,
      required this.date,
      required this.coursePrice,
      required this.purchasePrice,
      required this.purchaseRef,
      required this.type});

  factory _$_Purchase.fromJson(Map<String, dynamic> json) =>
      _$$_PurchaseFromJson(json);

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

  @override
  String toString() {
    return 'Purchase(id: $id, itemId: $itemId, date: $date, coursePrice: $coursePrice, purchasePrice: $purchasePrice, purchaseRef: $purchaseRef, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Purchase &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.coursePrice, coursePrice) ||
                other.coursePrice == coursePrice) &&
            (identical(other.purchasePrice, purchasePrice) ||
                other.purchasePrice == purchasePrice) &&
            (identical(other.purchaseRef, purchaseRef) ||
                other.purchaseRef == purchaseRef) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, itemId, date, coursePrice,
      purchasePrice, purchaseRef, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchaseCopyWith<_$_Purchase> get copyWith =>
      __$$_PurchaseCopyWithImpl<_$_Purchase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PurchaseToJson(
      this,
    );
  }
}

abstract class _Purchase implements Purchase {
  factory _Purchase(
      {required final int id,
      required final String itemId,
      required final DateTime date,
      required final int coursePrice,
      required final int purchasePrice,
      required final String purchaseRef,
      required final int type}) = _$_Purchase;

  factory _Purchase.fromJson(Map<String, dynamic> json) = _$_Purchase.fromJson;

  @override
  int get id;
  @override
  String get itemId;
  @override
  DateTime get date;
  @override
  int get coursePrice;
  @override
  int get purchasePrice;
  @override
  String get purchaseRef;
  @override
  int get type;
  @override
  @JsonKey(ignore: true)
  _$$_PurchaseCopyWith<_$_Purchase> get copyWith =>
      throw _privateConstructorUsedError;
}

Progress _$ProgressFromJson(Map<String, dynamic> json) {
  return _Progress.fromJson(json);
}

/// @nodoc
mixin _$Progress {
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgressCopyWith<Progress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressCopyWith<$Res> {
  factory $ProgressCopyWith(Progress value, $Res Function(Progress) then) =
      _$ProgressCopyWithImpl<$Res, Progress>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$ProgressCopyWithImpl<$Res, $Val extends Progress>
    implements $ProgressCopyWith<$Res> {
  _$ProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProgressCopyWith<$Res> implements $ProgressCopyWith<$Res> {
  factory _$$_ProgressCopyWith(
          _$_Progress value, $Res Function(_$_Progress) then) =
      __$$_ProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_ProgressCopyWithImpl<$Res>
    extends _$ProgressCopyWithImpl<$Res, _$_Progress>
    implements _$$_ProgressCopyWith<$Res> {
  __$$_ProgressCopyWithImpl(
      _$_Progress _value, $Res Function(_$_Progress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_Progress(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Progress implements _Progress {
  _$_Progress({required this.id});

  factory _$_Progress.fromJson(Map<String, dynamic> json) =>
      _$$_ProgressFromJson(json);

  @override
  final int id;

  @override
  String toString() {
    return 'Progress(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Progress &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProgressCopyWith<_$_Progress> get copyWith =>
      __$$_ProgressCopyWithImpl<_$_Progress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProgressToJson(
      this,
    );
  }
}

abstract class _Progress implements Progress {
  factory _Progress({required final int id}) = _$_Progress;

  factory _Progress.fromJson(Map<String, dynamic> json) = _$_Progress.fromJson;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_ProgressCopyWith<_$_Progress> get copyWith =>
      throw _privateConstructorUsedError;
}
