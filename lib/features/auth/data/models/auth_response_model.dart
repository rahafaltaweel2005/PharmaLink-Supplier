import '../../domain/entity/auth_response_entity.dart';
import '../../domain/entity/user_role.dart';

class AuthResponseModel {
  int? id;
  String? name;
  String? email;
  int? role;
  String? phoneNumber;
  String? accessToken;
  String? refreshToken;

  AuthResponseModel({
    this.id,
    this.name,
    this.email,
    this.role,
    this.phoneNumber,
    this.accessToken,
    this.refreshToken,
  });

  AuthResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    phoneNumber = json['phoneNumber'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    data['phoneNumber'] = phoneNumber;
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    return data;
  }

  AuthResponseEntity toEntity() {
    return AuthResponseEntity(
      id: id!,
      name: name!,
      email: email!,
      role: _mapRole(role!),
      phoneNumber: phoneNumber!,
      accessToken: accessToken!,
      refreshToken: refreshToken!,
    );
  }

  UserRole _mapRole(int role) {
    switch (role) {
      case 0:
        return UserRole.admin;

      case 1:
        return UserRole.pharmacist;

      case 2:
        return UserRole.supplier;

      default:
        throw Exception('Invalid role');
    }
  }
}
