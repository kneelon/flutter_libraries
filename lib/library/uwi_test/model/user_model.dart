import 'dart:convert';

class UserModel {
  final String email;
  final String name;
  final int id;
  final String website;

  UserModel({required this.email, required this.name, required this.id, required this.website});


  UserModel copyWith({
    String? email,
    String? name,
    int? id,
    String? website,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      id: id ?? this.id,
      website: website ?? this.website,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'name': name});
    result.addAll({'id': id});
    result.addAll({'website': website});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      id: map['id']?.toInt() ?? 0,
      website: map['website'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}