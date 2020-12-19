import 'package:flutter/material.dart';
import 'package:pMovie/view_models/movie_list_view_model.dart';
import 'package:pMovie/view_models/series_list_view_model.dart';
import 'package:pMovie/view_models/trending_list_view_model.dart';
import 'package:pMovie/widgets/movie_list.dart';
import 'package:pMovie/widgets/series_list.dart';
import 'package:pMovie/widgets/trending_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            elevation: 0,
            onPressed: () {},
            child: Text(
              'pMovie',
              style: Theme.of(context).textTheme.overline.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChangeNotifierProvider(
              create: (context) => MovieListViewModel(),
              child: MovieList(),
            ),
            ChangeNotifierProvider(
              create: (context) => SeriesListViewModel(),
              child: SeriesList(),
            ),
            ChangeNotifierProvider(
              create: (context) => TrendingListViewModel(),
              child: TrendingList(),
            ),
          ],
        ),
      ),
    );
  }
}
