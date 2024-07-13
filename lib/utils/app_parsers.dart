class AppParsers {
  /// Safely parses [value] to a num, returning 0 if not a num
  static num numParse(dynamic value) {
    if (value is num) {
      return value;
    } else {
      return 0;
    }
  }

  /// Safely parses [value] to a String, returning "" if not a String
  static String stringParse(dynamic value) {
    if (value is String) {
      return value;
    } else {
      return "";
    }
  }

  /// Safely parses [value] to a bool, returning false if not a bool
  static bool boolParse(dynamic value) {
    if (value is bool) {
      return value;
    } else {
      return false;
    }
  }

  /// Safely parses [value] to a List, returning [] if not a List
  static List listParse(dynamic value) {
    if (value is List) {
      return value;
    } else {
      return [];
    }
  }

  /// Safely parses [value] to a Map, returning {} if not a Map
  static Map mapParse(dynamic value) {
    if (value is Map) {
      return value;
    } else {
      return {};
    }
  }
}
