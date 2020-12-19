import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Movie {
  final int id;
  final String title;
  final DateTime releaseDate;
  final int voteCount;
  final String posterPath;

  Movie({
    @required this.id,
    @required this.title,
    @required this.releaseDate,
    @required this.voteCount,
    this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      releaseDate: DateTime.parse(json['release_date']),
      voteCount: json['vote_count'],
    );
  }

  void printDetails() {
    var dateFormat = DateFormat.yMMMd();

    print("===========");
    print("title: " + this.title);
    print("release date: " + dateFormat.format(this.releaseDate));
    print("vote count: " + this.voteCount.toString());
  }
}
