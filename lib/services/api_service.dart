import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pMovie/constants/media_type.dart';
import 'package:pMovie/models/media.dart';
import 'package:pMovie/models/movie.dart';
import 'package:pMovie/models/tv_series.dart';

class ApiService {
  static final _baseUrl = "https://api.themoviedb.org/3/";
  static final _apiKey = "1a97f3b8d5deee1d649c0025f3acf75c";
  static final posterUrl = "https://image.tmdb.org/t/p/w342";
  static final backdropUrl = "https://image.tmdb.org/t/p/w780";

  Future<List<Media>> fetchMovieList() async {
    final url = _baseUrl + "discover/movie";

    Map<String, dynamic> queryParams = {
      'api_key': _apiKey,
      'primary_release_year': '2020',
      'sort_by': 'vote_average.desc'
    };
    String queryString = Uri(queryParameters: queryParams).query;

    var requestUrl = url + '?' + queryString;
    final response = await http.get(requestUrl);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["results"];
      return json
          .map((movie) => Media.fromJson(movie, MediaType.movie))
          .toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  Future<List<Media>> fetchSeriesList() async {
    final url = _baseUrl + "discover/tv";

    Map<String, dynamic> queryParams = {
      'api_key': _apiKey,
      'primary_release_year': '2020',
      'sort_by': 'vote_average.desc'
    };
    String queryString = Uri(queryParameters: queryParams).query;

    var requestUrl = url + '?' + queryString;
    final response = await http.get(requestUrl);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["results"];
      return json
          .map((series) => Media.fromJson(series, MediaType.series))
          .toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  Future<List<Media>> fetchTrendingList() async {
    final url = _baseUrl + "trending/all/week";

    Map<String, dynamic> queryParams = {
      'api_key': _apiKey,
    };
    String queryString = Uri(queryParameters: queryParams).query;

    var requestUrl = url + '?' + queryString;
    final response = await http.get(requestUrl);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["results"];
      return json.map((media) {
        MediaType type;
        if (media['title'] != null) {
          type = MediaType.movie;
        } else {
          type = MediaType.series;
        }
        return Media.fromJson(media, type);
      }).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  Future<Movie> fetchMovieDetails(int movieId) async {
    final url = _baseUrl + "movie/$movieId";

    Map<String, dynamic> queryParams = {
      'api_key': _apiKey,
    };
    String queryString = Uri(queryParameters: queryParams).query;

    var requestUrl = url + '?' + queryString;
    final response = await http.get(requestUrl);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return Movie.fromJson(body);
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  Future<TVSeries> fetchSeriesDetails(int seriesId) async {
    final url = _baseUrl + "tv/$seriesId";

    Map<String, dynamic> queryParams = {
      'api_key': _apiKey,
    };
    String queryString = Uri(queryParameters: queryParams).query;

    var requestUrl = url + '?' + queryString;
    final response = await http.get(requestUrl);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return TVSeries.fromJson(body);
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
