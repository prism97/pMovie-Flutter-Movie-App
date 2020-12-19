import 'package:flutter/material.dart';
import 'package:pMovie/constants/media_type.dart';

class Media {
  final String title;
  final DateTime releaseDate;
  final int voteCount;
  final String posterPath;
  final MediaType mediaType;

  Media({
    @required this.title,
    @required this.releaseDate,
    @required this.voteCount,
    @required this.mediaType,
    this.posterPath,
  });

  factory Media.fromJson(Map<String, dynamic> json, MediaType type) {
    if (type == MediaType.movie) {
      return Media(
        title: json['title'],
        releaseDate: json['release_date'],
        voteCount: json['vote_count'],
        mediaType: type,
      );
    } else if (type == MediaType.tvseries) {
      return Media(
        title: json['name'],
        releaseDate: json['first_air_date'],
        voteCount: json['vote_count'],
        mediaType: type,
      );
    } else {
      return null;
    }
  }
}
