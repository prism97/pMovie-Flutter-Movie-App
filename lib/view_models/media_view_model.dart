import 'package:flutter/material.dart';
import 'package:pMovie/constants/media_type.dart';
import 'package:pMovie/models/media.dart';

class MediaViewModel {
  final Media media;

  MediaViewModel({@required this.media});

  int get id {
    return this.media.id;
  }

  String get title {
    return this.media.title;
  }

  DateTime get releaseDate {
    return this.media.releaseDate;
  }

  int get voteCount {
    return this.media.voteCount;
  }

  String get posterPath {
    return this.media.posterPath;
  }

  String get backdropPath {
    return this.media.backdropPath;
  }

  MediaType get mediaType {
    return this.media.mediaType;
  }
}
