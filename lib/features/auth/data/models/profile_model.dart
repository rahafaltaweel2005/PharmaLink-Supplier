import '../../domain/entity/profile_entity.dart';
import '../../domain/entity/user_role.dart';

class ProfileModel {
  int? id;
  String? name;
  String? email;
  int? role;
  String? phoneNumber;
  Null doctorName;
  Null location;
  Null licenseNumber;

  ProfileModel(
      {this.id,
        this.name,
        this.email,
        this.role,
        this.phoneNumber,
        this.doctorName,
        this.location,
        this.licenseNumber});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    phoneNumber = json['phoneNumber'];
    doctorName = json['doctorName'];
    location = json['location'];
    licenseNumber = json['licenseNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    data['phoneNumber'] = phoneNumber;
    data['doctorName'] = doctorName;
    data['location'] = location;
    data['licenseNumber'] = licenseNumber;
    return data;
  }

  ProfileEntity toEntity() {
    return ProfileEntity(
      id: id!,
      name: name!,
      email: email!,
      role: _mapRole(role!),
      phoneNumber: phoneNumber!,
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
