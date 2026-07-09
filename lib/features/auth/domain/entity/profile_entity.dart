import 'package:pharma_link_supplier/features/auth/domain/entity/user_role.dart';

class ProfileEntity {
  final int id;
  final String name;
  final String email;
  final UserRole role;
  final String phoneNumber;

  ProfileEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.phoneNumber,
  });
}
