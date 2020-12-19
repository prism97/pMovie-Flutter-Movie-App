import 'package:flutter/material.dart';

class Movie {
  final String title;
  final DateTime releaseDate;
  final int voteCount;
  final String posterPath;

  Movie({
    @required this.title,
    @required this.releaseDate,
    @required this.voteCount,
    this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      releaseDate: json['release_date'],
      voteCount: json['vote_count'],
    );
  }
}
