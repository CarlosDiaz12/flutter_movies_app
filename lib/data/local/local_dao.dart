import 'package:flutter_movies_app/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDao {
  late SharedPreferences _sharedPreferences;
  LocalDao({required SharedPreferences sharedPreferences}) {
    _sharedPreferences = sharedPreferences;
  }

  Future<void> saveGuestSessionId(String sessionId) async {
    await _sharedPreferences.setString(AppConstants.SESSION_ID_KEY, sessionId);
  }

  String? getGuestSessionId() {
    return _sharedPreferences.getString(AppConstants.SESSION_ID_KEY);
  }
}
