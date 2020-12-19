import 'package:flutter/material.dart';
import 'package:pMovie/constants/list_type.dart';
import 'package:pMovie/services/api_service.dart';
import 'package:pMovie/view_models/media_view_model.dart';

class MediaListViewModel extends ChangeNotifier {
  List<MediaViewModel> mediaList = List<MediaViewModel>();

  Future<void> fetchMediaList(ListType type) async {
    var results;
    switch (type) {
      case ListType.movies:
        results = await ApiService().fetchMovieList();
        break;
      case ListType.series:
        results = await ApiService().fetchSeriesList();
        break;
      case ListType.trending:
        results = await ApiService().fetchTrendingList();
        break;
      default:
    }

    this.mediaList =
        results.map((item) => MediaViewModel(media: item)).toList();
    print(this.mediaList);
    notifyListeners();
  }
}
