import 'package:flutter/material.dart';
import 'package:pMovie/services/api_service.dart';
import 'package:pMovie/view_models/media_view_model.dart';

class SeriesListViewModel extends ChangeNotifier {
  List<MediaViewModel> seriesList = List<MediaViewModel>();

  Future<void> fetchSeriesList() async {
    final results = await ApiService().fetchSeriesList();
    this.seriesList =
        results.map((item) => MediaViewModel(media: item)).toList();
    print(this.seriesList);
    notifyListeners();
  }
}
