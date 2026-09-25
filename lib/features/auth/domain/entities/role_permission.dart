class RolePermission {
  RolePermission({
    required this.permission,
    required List<Object> values,
    required this.isAllowed,
  }) : values = _validateValues(values);

  final String permission;
  final List<Object> values;
  final bool isAllowed;

  static List<Object> _validateValues(List<Object> values) {
    if (values.any((value) => value is! String && value is! bool)) {
      throw ArgumentError(
        'Permission values must contain only strings or booleans.',
      );
    }

    return List<Object>.unmodifiable(values);
  }
}
