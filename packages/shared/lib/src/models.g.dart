// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      authId: json['authId'] as String?,
      email: json['email'] as String,
      name: json['name'] as String,
      paymentAccountId: json['paymentAccountId'] as String?,
      purchases: (json['purchases'] as List<dynamic>?)
              ?.map((e) => Purchase.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      progressEntries: (json['progressEntries'] as List<dynamic>?)
              ?.map((e) => Progress.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'authId': instance.authId,
      'email': instance.email,
      'name': instance.name,
      'paymentAccountId': instance.paymentAccountId,
      'purchases': instance.purchases,
      'progressEntries': instance.progressEntries,
    };

_$_Purchase _$$_PurchaseFromJson(Map<String, dynamic> json) => _$_Purchase(
      id: json['id'] as int,
      itemId: json['itemId'] as String,
      date: DateTime.parse(json['date'] as String),
      coursePrice: json['coursePrice'] as int,
      purchasePrice: json['purchasePrice'] as int,
      purchaseRef: json['purchaseRef'] as String,
      type: json['type'] as int,
    );

Map<String, dynamic> _$$_PurchaseToJson(_$_Purchase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'date': instance.date.toIso8601String(),
      'coursePrice': instance.coursePrice,
      'purchasePrice': instance.purchasePrice,
      'purchaseRef': instance.purchaseRef,
      'type': instance.type,
    };

_$_Progress _$$_ProgressFromJson(Map<String, dynamic> json) => _$_Progress(
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_ProgressToJson(_$_Progress instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
