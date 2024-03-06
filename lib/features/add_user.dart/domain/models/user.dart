import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String name;
  final String lastname;
  final int phone;
  final String address;
  final String email;
  final String dateOfBirth;
  final String password;
  final bool isActive;

  User({
    required this.name,
    required this.lastname,
    required this.phone,
    required this.address,
    required this.email,
    required this.dateOfBirth,
    required this.password,
    required this.isActive,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
