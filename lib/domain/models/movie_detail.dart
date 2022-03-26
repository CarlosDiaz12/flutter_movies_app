// ignore_for_file: non_constant_identifier_names

import 'genre.dart';
import 'production_company.dart';
import 'production_country.dart';
import 'spoken_language.dart';

class GetMovieDetailResponse {
  bool? adult;
  String? backdro_path;
  int? budget;
  List<Genre>? genres;
  String? homepage;
  int? id;
  String? imdb_id;
  String? original_language;
  String? original_title;
  String? overview;
  double? popularity;
  String? poster_path;
  List<ProductionCompany>? production_companies;
  List<ProductionCountry>? production_countries;
  String? release_date;
  int? revenue;
  int? runtime;
  List<SpokenLanguage>? spoken_languages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? vote_average;
  int? vote_count;
}
