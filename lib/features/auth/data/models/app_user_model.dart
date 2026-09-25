import 'package:venuze_app/core/utils/json_reader.dart';
import 'package:venuze_app/features/auth/domain/entities/app_user.dart';
import 'role_permission_model.dart';
import 'user_profile_model.dart';

class AppUserModel {
  AppUserModel({
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
    required List<RolePermissionModel> rolePermissions,
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
  final UserProfileModel? profile;
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
  final List<RolePermissionModel> rolePermissions;

  final DateTime createdAt;
  final bool isVerified;
  final bool isActive;

  factory AppUserModel.fromJson(Map<String, dynamic> json) {
    final rawProfile = json['profile'];

    return AppUserModel(
      id: JsonReader.nonEmptyString(json, 'id'),
      email: JsonReader.nonEmptyString(json, 'email'),
      name: JsonReader.string(json, 'name'),
      firstName: JsonReader.nullableString(json, 'first_name'),
      lastName: JsonReader.nullableString(json, 'last_name'),
      phone: JsonReader.nullableString(json, 'phone'),
      profileImage: JsonReader.nullableString(json, 'profile_image'),
      role: JsonReader.nonEmptyString(json, 'role'),
      isStaff: JsonReader.boolean(json, 'is_staff'),
      profile: rawProfile == null
          ? null
          : UserProfileModel.fromJson(JsonReader.object(rawProfile)),
      status: JsonReader.nonEmptyString(json, 'status'),
      emailVerified: JsonReader.boolean(json, 'email_verified'),
      phoneVerified: JsonReader.boolean(json, 'phone_verified'),
      authProvider: JsonReader.nonEmptyString(json, 'auth_provider'),
      hasGoogleCalendar: JsonReader.boolean(json, 'has_google_calendar'),
      emailEnabled: JsonReader.boolean(json, 'email_enabled'),
      fcmEnabled: JsonReader.boolean(json, 'fcm_enabled'),
      totpEnabled: JsonReader.boolean(json, 'totp_enabled'),
      unreadMessagesCount: JsonReader.integer(json, 'unread_messages_count'),
      businessId: JsonReader.nullableString(json, 'business_id'),
      rolePermissions: JsonReader.list(json, 'role_permissions')
          .map(
            (value) => RolePermissionModel.fromJson(JsonReader.object(value)),
          )
          .toList(),
      createdAt: JsonReader.dateTime(json, 'created_at'),
      isVerified: JsonReader.boolean(json, 'is_verified'),
      isActive: JsonReader.boolean(json, 'is_active'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'profile_image': profileImage,
      'role': role,
      'is_staff': isStaff,
      'profile': profile?.toJson(),
      'status': status,
      'email_verified': emailVerified,
      'phone_verified': phoneVerified,
      'auth_provider': authProvider,
      'has_google_calendar': hasGoogleCalendar,
      'email_enabled': emailEnabled,
      'fcm_enabled': fcmEnabled,
      'totp_enabled': totpEnabled,
      'unread_messages_count': unreadMessagesCount,
      'business_id': businessId,
      'role_permissions': rolePermissions
          .map((permission) => permission.toJson())
          .toList(),
      'created_at': createdAt.toUtc().toIso8601String(),
      'is_verified': isVerified,
      'is_active': isActive,
    };
  }

  AppUser toEntity() {
    return AppUser(
      id: id,
      email: email,
      name: name,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      profileImage: profileImage,
      role: role,
      isStaff: isStaff,
      profile: profile?.toEntity(),
      status: status,
      emailVerified: emailVerified,
      phoneVerified: phoneVerified,
      authProvider: authProvider,
      hasGoogleCalendar: hasGoogleCalendar,
      emailEnabled: emailEnabled,
      fcmEnabled: fcmEnabled,
      totpEnabled: totpEnabled,
      unreadMessagesCount: unreadMessagesCount,
      businessId: businessId,
      rolePermissions: rolePermissions
          .map((permission) => permission.toEntity())
          .toList(),
      createdAt: createdAt,
      isVerified: isVerified,
      isActive: isActive,
    );
  }
}
