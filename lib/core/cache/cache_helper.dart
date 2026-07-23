import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A class that provides methods for saving and retrieving data from cache.
class CacheHelper {
  /// The shared preferences instance used for saving and retrieving non-sensitive data.
  final SharedPreferences _sharedPreferences;

  /// Creates a new instance of [CacheHelper] with the provided [sharedPreferences].
  ///
  /// The [sharedPreferences] parameter is required and allows the class to save and retrieve non-sensitive data.

  CacheHelper(
    this._sharedPreferences,
  );

  /// Retrieves the value associated with the specified [key] from the cache.
  ///
  /// Returns the value associated with the [key], or null if the key does not exist.
  dynamic getData({
    required String key,
  }) {
    debugPrint('[CacheHelper] Getting data for key: $key');
    final value = _sharedPreferences.get(key);
    debugPrint('[CacheHelper] Got data: $value');
    return value;
  }

  /// Saves the [value] associated with the specified [key] to the cache.
  ///
  /// If the cache already contains a value for the specified [key], it will be replaced.
  ///
  /// Returns true if the value was successfully saved, false otherwise.
  Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    debugPrint('[CacheHelper] Saving data for key: $key, value: $value');
    switch (value.runtimeType) {
      case const (String):
        debugPrint('[CacheHelper] Saving string value for key: $key');
        return await _sharedPreferences.setString(key, value);
      case const (bool):
        debugPrint('[CacheHelper] Saving bool value for key: $key');
        return await _sharedPreferences.setBool(key, value);
      case const (int):
        debugPrint('[CacheHelper] Saving int value for key: $key');
        return await _sharedPreferences.setInt(key, value);
      case const (double):
        debugPrint('[CacheHelper] Saving double value for key: $key');
        return await _sharedPreferences.setDouble(key, value);
      case const (List<String>):
        debugPrint('[CacheHelper] Saving string list value for key: $key');
        return await _sharedPreferences.setStringList(key, value);
      default:
        debugPrint(
            '[CacheHelper] Cannot save value for key: $key, unsupported type: ${value.runtimeType}');
        return false;
    }
  }

  /// Removes the value associated with the specified [key] from the cache.
  ///
  /// If the cache does not contain a value for the specified [key], this method does nothing.
  ///
  /// Returns true if the value was successfully removed, false otherwise.
  Future<bool> removeData({
    required String key,
  }) async {
    debugPrint('[CacheHelper] Removing data for key: $key');
    final result = await _sharedPreferences.remove(key);
    debugPrint('[CacheHelper] Removed data for key: $key, result: $result');
    return result;
  }

  /// Removes all values from the cache.
  ///
  /// Returns a Future that completes with true if the cache was successfully cleared, false otherwise.
  Future<bool> clear() async {
    return _sharedPreferences.clear();
  }


}
