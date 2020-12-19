import 'package:flutter/material.dart';

class TVSeries {
  final int id;
  final String title;
  final DateTime releaseDate;
  final int voteCount;
  final String posterPath;

  TVSeries({
    @required this.id,
    @required this.title,
    @required this.releaseDate,
    @required this.voteCount,
    this.posterPath,
  });

  factory TVSeries.fromJson(Map<String, dynamic> json) {
    return TVSeries(
      id: json['id'],
      title: json['name'],
      releaseDate: json['first_air_date'],
      voteCount: json['vote_count'],
    );
  }
}
