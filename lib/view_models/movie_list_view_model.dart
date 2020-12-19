import 'package:flutter/material.dart';
import 'package:pMovie/services/api_service.dart';
import 'package:pMovie/view_models/media_view_model.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MediaViewModel> movieList = List<MediaViewModel>();

  Future<void> fetchMovieList() async {
    final results = await ApiService().fetchMovieList();
    this.movieList =
        results.map((item) => MediaViewModel(media: item)).toList();
    print(this.movieList);
    notifyListeners();
  }
}
