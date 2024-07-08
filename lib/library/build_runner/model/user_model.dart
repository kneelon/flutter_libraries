import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? name;
  final String? address;
  final int? age;

  UserModel(
    this.name,
    this.address,
    this.age,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

///Instruction below
// Create code below and run the command flutter pub run build_runner build --delete-conflicting-outputs
// part 'user_model.dart.g.dart';
// @JsonSerializable()
// factory UserModel.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
// Map<String, dynamic> toJson() => _$UserToJson(this);
}