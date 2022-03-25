// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class RemoteConstants {
  static const API_URL_BASE = 'https://api.themoviedb.org/3';
  static const IMAGE_API_URL = 'https://image.tmdb.org/t/p/original';
  static final API_KEY = dotenv.env['API_KEY'];
  static Map<String, dynamic> GetApiKeyQueryParam() {
    return {'api_key': API_KEY};
  }
}
