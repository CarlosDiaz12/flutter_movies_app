import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class MovieLocalDto {
  String? Id;
  String? title;
  String? release_date;
  double? vote_average;
  String? poster_path;
  MovieLocalDto({
    this.Id,
    this.title,
    this.release_date,
    this.vote_average,
    this.poster_path,
  });

  MovieLocalDto copyWith({
    String? Id,
    String? title,
    String? release_date,
    double? vote_average,
    String? poster_path,
  }) {
    return MovieLocalDto(
      Id: Id ?? this.Id,
      title: title ?? this.title,
      release_date: release_date ?? this.release_date,
      vote_average: vote_average ?? this.vote_average,
      poster_path: poster_path ?? this.poster_path,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (Id != null) {
      result.addAll({'Id': Id});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (release_date != null) {
      result.addAll({'release_date': release_date});
    }
    if (vote_average != null) {
      result.addAll({'vote_average': vote_average});
    }
    if (poster_path != null) {
      result.addAll({'poster_path': poster_path});
    }

    return result;
  }

  factory MovieLocalDto.fromMap(Map<String, dynamic> map) {
    return MovieLocalDto(
      Id: map['Id'],
      title: map['title'],
      release_date: map['release_date'],
      vote_average: map['vote_average']?.toDouble(),
      poster_path: map['poster_path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieLocalDto.fromJson(String source) =>
      MovieLocalDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieLocalDto(Id: $Id, title: $title, release_date: $release_date, vote_average: $vote_average, poster_path: $poster_path)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieLocalDto &&
        other.Id == Id &&
        other.title == title &&
        other.release_date == release_date &&
        other.vote_average == vote_average &&
        other.poster_path == poster_path;
  }

  @override
  int get hashCode {
    return Id.hashCode ^
        title.hashCode ^
        release_date.hashCode ^
        vote_average.hashCode ^
        poster_path.hashCode;
  }
}
