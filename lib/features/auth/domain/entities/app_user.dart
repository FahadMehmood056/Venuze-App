import 'role_permission.dart';
import 'user_profile.dart';

class AppUser {
  AppUser({
    required this.id,
    required this.email,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.profileImage,
    required this.role,
    required this.isStaff,
    required this.profile,
    required this.status,
    required this.emailVerified,
    required this.phoneVerified,
    required this.authProvider,
    required this.hasGoogleCalendar,
    required this.emailEnabled,
    required this.fcmEnabled,
    required this.totpEnabled,
    required this.unreadMessagesCount,
    required this.businessId,
    required List<RolePermission> rolePermissions,
    required this.createdAt,
    required this.isVerified,
    required this.isActive,
  }) : rolePermissions = List.unmodifiable(rolePermissions);

  final String id;
  final String email;
  final String name;

  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? profileImage;

  final String role;
  final bool isStaff;
  final UserProfile? profile;
  final String status;

  final bool emailVerified;
  final bool phoneVerified;
  final String authProvider;

  final bool hasGoogleCalendar;
  final bool emailEnabled;
  final bool fcmEnabled;
  final bool totpEnabled;

  final int unreadMessagesCount;
  final String? businessId;
  final List<RolePermission> rolePermissions;

  final DateTime createdAt;
  final bool isVerified;
  final bool isActive;
}
