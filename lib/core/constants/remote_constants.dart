import 'package:flutter_dotenv/flutter_dotenv.dart';

class RemoteConstants {
  static const API_URL_BASE = 'https://api.themoviedb.org/3';
  static final API_KEY = dotenv.env['API_KEY'];
  static GetApiKeyQueryParam() {
    return {'api_key': API_KEY};
  }
}
