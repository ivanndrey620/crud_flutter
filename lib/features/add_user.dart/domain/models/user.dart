import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String id;

  final String name;
  final String lastname;
  final int phone;
  final String address;
  final String email;
  final String dateOfBirth;
  final String password;
  final bool isActive;

  User({
    this.id = '',
    required this.name,
    required this.lastname,
    required this.phone,
    required this.address,
    required this.email,
    required this.dateOfBirth,
    required this.password,
    required this.isActive,
  });

  User copyWith({
    String? id,
    String? name,
    String? lastname,
    int? phone,
    String? address,
    String? email,
    String? dateOfBirth,
    String? password,
    bool? isActive,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        lastname: lastname ?? this.lastname,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        email: email ?? this.email,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        password: password ?? this.password,
        isActive: isActive ?? this.isActive,
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
