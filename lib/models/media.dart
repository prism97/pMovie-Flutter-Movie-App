import 'package:flutter/material.dart';
import 'package:pMovie/constants/media_type.dart';

class Media {
  final int id;
  final String title;
  final DateTime releaseDate;
  final int voteCount;
  final String posterPath;
  final String backdropPath;
  final MediaType mediaType;

  Media({
    @required this.id,
    @required this.title,
    @required this.releaseDate,
    @required this.voteCount,
    @required this.mediaType,
    @required this.posterPath,
    @required this.backdropPath,
  });

  factory Media.fromJson(Map<String, dynamic> json, MediaType type) {
    if (type == MediaType.movie) {
      return Media(
        id: json['id'],
        title: json['title'],
        releaseDate: DateTime.parse(json['release_date']),
        voteCount: json['vote_count'],
        mediaType: type,
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
      );
    } else if (type == MediaType.series) {
      return Media(
        id: json['id'],
        title: json['name'],
        // first_air_date is causing parse error
        releaseDate: DateTime.now(),
        voteCount: json['vote_count'],
        mediaType: type,
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
      );
    } else {
      return null;
    }
  }
}
