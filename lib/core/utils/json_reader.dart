class JsonReader {
  JsonReader._();

  static Map<String, dynamic> object(Object? value) {
    if (value is Map<String, dynamic>) return value;

    throw const FormatException('Expected a JSON object.');
  }

  static String string(Map<String, dynamic> json, String key) {
    final value = json[key];

    if (value is String) return value;

    throw FormatException('Expected a string for "$key".');
  }

  static String nonEmptyString(Map<String, dynamic> json, String key) {
    final value = string(json, key);

    if (value.trim().isEmpty) {
      throw FormatException('Expected a non-empty string for "$key".');
    }

    return value;
  }

  static bool boolean(Map<String, dynamic> json, String key) {
    final value = json[key];

    if (value is bool) return value;

    throw FormatException('Expected a boolean for "$key".');
  }

  static int integer(Map<String, dynamic> json, String key) {
    final value = json[key];

    if (value is int) return value;

    throw FormatException('Expected an integer for "$key".');
  }

  static double? nullableDouble(Map<String, dynamic> json, String key) {
    final value = json[key];

    if (value == null) return null;

    if (value is num && value.isFinite) {
      return value.toDouble();
    }

    throw FormatException('Expected a number or null for "$key".');
  }

  static DateTime dateTime(Map<String, dynamic> json, String key) {
    final value = string(json, key);
    final parsed = DateTime.tryParse(value);

    if (parsed == null) {
      throw FormatException('Expected a date-time for "$key".');
    }

    return parsed;
  }

  static List<dynamic> list(Map<String, dynamic> json, String key) {
    final value = json[key];

    if (value is List) return value;

    throw FormatException('Expected a list for "$key".');
  }

  static String? nullableString(Map<String, dynamic> json, String key) {
    final value = json[key];

    if (value == null) return null;
    if (value is String) return value;

    throw FormatException('Expected a string or null for "$key".');
  }
}
