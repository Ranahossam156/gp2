import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';
@JsonSerializable()
class Users{
  int? id;
  String? name;
  String? address;
  String? email;
  String? password;
  bool? isAdmin;
  bool? isPremium;
  String? carLicense;
  String? resetCode;
  String? lastResetDate;
  bool? isVerified;
  //List<Users>? result;
  Users(
      {this.id,
        this.name,
        this.address,
        this.email,
        this.password,
        this.isAdmin,
        this.isPremium,
        this.carLicense,
        this.resetCode,
        this.lastResetDate,
        this.isVerified});
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}