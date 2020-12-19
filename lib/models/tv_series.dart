import 'package:flutter/material.dart';

class TVSeries {
  final int id;
  final String name;
  final DateTime firstAirDate;
  final int voteCount;
  final String posterPath;

  TVSeries({
    @required this.id,
    @required this.name,
    @required this.firstAirDate,
    @required this.voteCount,
    @required this.posterPath,
  });

  factory TVSeries.fromJson(Map<String, dynamic> json) {
    return TVSeries(
      id: json['id'],
      name: json['name'],
      // json['first_air_date'] is incompatible with dart
      firstAirDate: DateTime.now(),
      voteCount: json['vote_count'],
      posterPath: json['poster_path'],
    );
  }
}
