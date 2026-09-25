import 'package:venuze_app/core/utils/json_reader.dart';
import 'package:venuze_app/features/auth/domain/entities/role_permission.dart';

class RolePermissionModel {
  RolePermissionModel({
    required this.permission,
    required List<Object> values,
    required this.isAllowed,
  }) : values = _parseValues(values);

  final String permission;
  final List<Object> values;
  final bool isAllowed;

  factory RolePermissionModel.fromJson(Map<String, dynamic> json) {
    return RolePermissionModel(
      permission: JsonReader.nonEmptyString(json, 'permission'),
      values: _parseValues(JsonReader.list(json, 'value')),
      isAllowed: JsonReader.boolean(json, 'is_allowed'),
    );
  }

  Map<String, dynamic> toJson() {
    return {'permission': permission, 'value': values, 'is_allowed': isAllowed};
  }

  RolePermission toEntity() {
    return RolePermission(
      permission: permission,
      values: values,
      isAllowed: isAllowed,
    );
  }

  static List<Object> _parseValues(Iterable<Object?> values) {
    return List<Object>.unmodifiable(
      values.map((value) {
        if (value is String || value is bool) {
          return value!;
        }

        throw const FormatException(
          'Expected strings or booleans in permission values.',
        );
      }),
    );
  }
}
