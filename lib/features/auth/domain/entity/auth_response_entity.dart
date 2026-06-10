import 'package:pharma_link_supplier/features/auth/domain/entity/user_role.dart';

class AuthResponseEntity {
  final int id;
  final String name;
  final String email;
  final UserRole role;
  final String phoneNumber;
  final String accessToken;
  final String refreshToken;

  AuthResponseEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.phoneNumber,
    required this.accessToken,
    required this.refreshToken,
  });
}
