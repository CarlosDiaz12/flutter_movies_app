import 'package:flutter_movies_app/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDao {
  late SharedPreferences _sharedPreferences;
  LocalDao({required SharedPreferences sharedPreferences}) {
    _sharedPreferences = sharedPreferences;
  }

  Future<void> saveGuestSessionInfo(String sessionId, String expireDate) async {
    await _sharedPreferences.setString(
        AppConstants.SESSION_ID_EXPIRE_DATE_KEY, expireDate);
    await _sharedPreferences.setString(AppConstants.SESSION_ID_KEY, sessionId);
  }

  String? getGuestSessionId() {
    return _sharedPreferences.getString(AppConstants.SESSION_ID_KEY);
  }

  DateTime? getSessionExpireDate() {
    var value =
        _sharedPreferences.getString(AppConstants.SESSION_ID_EXPIRE_DATE_KEY);
    if (value == null) return null;

    return DateTime.parse(value.substring(0, 10));
  }
}
