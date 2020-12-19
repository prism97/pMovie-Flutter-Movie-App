import 'package:flutter/material.dart';
import 'package:pMovie/models/movie.dart';
import 'package:pMovie/services/api_service.dart';

class MovieViewModel extends ChangeNotifier {
  Movie movie;

  Future<void> fetchMovie(int id) async {
    this.movie = await ApiService().fetchMovieDetails(id);
    notifyListeners();
  }
}
