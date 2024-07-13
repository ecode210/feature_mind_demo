import 'package:feature_mind_demo/utils/app_logger.dart';
import 'package:get_storage/get_storage.dart';

class AppStorage {
  final _instance = GetStorage("Feature Mind");

  /// Write [key] and [value] to local storage
  Future<void> write(String key, dynamic value) async {
    try {
      _instance.write(key, value);
    } catch (e, s) {
      AppLogger.log("Local Storage Write Error", e: e, s: s);
    }
  }

  /// Reads from local storage using [key]
  Future<T?> read<T>(String key) async {
    try {
      final value = _instance.read<T>(key);
      return value;
    } catch (e, s) {
      AppLogger.log("Local Storage Read Error", e: e, s: s);
      return null;
    }
  }
}
