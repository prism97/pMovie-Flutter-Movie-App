import 'package:flutter/material.dart';

class TVSeries {
  final String title;
  final DateTime releaseDate;
  final int voteCount;
  final String posterPath;

  TVSeries({
    @required this.title,
    @required this.releaseDate,
    @required this.voteCount,
    this.posterPath,
  });

  factory TVSeries.fromJson(Map<String, dynamic> json) {
    return TVSeries(
      title: json['name'],
      releaseDate: json['first_air_date'],
      voteCount: json['vote_count'],
    );
  }
}
