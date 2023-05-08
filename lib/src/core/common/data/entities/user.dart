import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final int? id;
  final String? name;
  final String? lastName;
  final String? firstName;
  final String? email;
  final String? password;
  final String? gender;
  final String? phoneNumber;
  final String? profilePicture;
  final String? createdAt;
  final int? isContactCount;
  final int? notificationsCount;
  final int? tfa;
  final String? publicKey;
  String? token;

  User(
      {this.name,
      this.lastName,
      this.firstName,
      this.profilePicture,
      this.email,
      this.id,
      this.password,
      this.gender,
      this.phoneNumber,
      this.createdAt,
      this.token,
      this.notificationsCount,
      this.tfa,
      this.publicKey,
      this.isContactCount});

  factory User.fromJson(json) => _$UserFromJson(json);

  toJson() => _$UserToJson(this);

  static List<User> fromJsonList(List json) {
    return json.map((e) => User.fromJson(e)).toList();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
