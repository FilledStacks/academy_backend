import 'package:db/db.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class User with _$User {
  factory User({
    required int id,
    String? authId,
    required String email,
    required String name,

    /// The Id of the users payment account
    String? paymentAccountId,
    @Default([]) List<Purchase> purchases,
    @Default([]) List<Progress> progressEntries,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromDb(DbUser dbUser) {
    return User(
      id: dbUser.id,
      name: dbUser.name,
      email: dbUser.email,
      authId: dbUser.authId,
      paymentAccountId: dbUser.paymentAccountId,
      progressEntries:
          dbUser.progressEntries.map((e) => Progress.fromDb(e)).toList(),
      purchases: dbUser.purchases.map((e) => Purchase.fromDb(e)).toList(),
    );
  }

  @override
  String toString() {
    return '$id $name';
  }
}

@freezed
class Purchase with _$Purchase implements DbPurchase {
  factory Purchase({
    required int id,
    required String itemId,
    required DateTime date,
    required int coursePrice,
    required int purchasePrice,
    required String purchaseRef,
    required int type,
  }) = _Purchase;

  factory Purchase.fromJson(Map<String, dynamic> json) =>
      _$PurchaseFromJson(json);

  factory Purchase.fromDb(DbPurchase purchase) {
    return Purchase(
      id: purchase.id,
      itemId: purchase.itemId,
      date: purchase.date,
      coursePrice: purchase.coursePrice,
      purchasePrice: purchase.purchasePrice,
      purchaseRef: purchase.purchaseRef,
      type: purchase.type,
    );
  }
}

@freezed
class Progress with _$Progress {
  factory Progress({
    required int id,
    // required Course course;
  }) = _Progress;

  factory Progress.fromJson(Map<String, dynamic> json) =>
      _$ProgressFromJson(json);

  factory Progress.fromDb(DbProgress progress) {
    return Progress(
      id: progress.id,
    );
  }
}
