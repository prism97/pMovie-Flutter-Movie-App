import 'package:flutter/material.dart';
import 'package:pMovie/services/api_service.dart';
import 'package:pMovie/view_models/media_view_model.dart';

class TrendingListViewModel extends ChangeNotifier {
  List<MediaViewModel> trendingList = List<MediaViewModel>();

  Future<void> fetchTrendingList() async {
    final results = await ApiService().fetchTrendingList();
    this.trendingList =
        results.map((item) => MediaViewModel(media: item)).toList();
    print(this.trendingList);
    notifyListeners();
  }
}
