import 'package:flutter/material.dart';
import 'package:pMovie/services/api_service.dart';
import 'package:pMovie/view_models/media_view_model.dart';

class MediaListViewModel extends ChangeNotifier {
  List<MediaViewModel> movieList = List<MediaViewModel>();
  List<MediaViewModel> seriesList = List<MediaViewModel>();
  List<MediaViewModel> trendingList = List<MediaViewModel>();

  Future<void> fetchMovieList() async {
    final results = await ApiService().fetchMovieList();
    this.movieList =
        results.map((item) => MediaViewModel(media: item)).toList();
    print(this.movieList);
    notifyListeners();
  }

  Future<void> fetchSeriesList() async {
    final results = await ApiService().fetchSeriesList();
    this.seriesList =
        results.map((item) => MediaViewModel(media: item)).toList();
    print(this.seriesList);
    notifyListeners();
  }

  Future<void> fetchTrendingList() async {
    final results = await ApiService().fetchTrendingList();
    this.trendingList =
        results.map((item) => MediaViewModel(media: item)).toList();
    print(this.trendingList);
    notifyListeners();
  }
}
