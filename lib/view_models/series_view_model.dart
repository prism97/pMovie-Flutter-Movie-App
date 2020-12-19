import 'package:flutter/material.dart';
import 'package:pMovie/models/tv_series.dart';
import 'package:pMovie/services/api_service.dart';

class SeriesViewModel extends ChangeNotifier {
  TVSeries series;

  Future<void> fetchSeries(int id) async {
    this.series = await ApiService().fetchSeriesDetails(id);
    notifyListeners();
  }
}
