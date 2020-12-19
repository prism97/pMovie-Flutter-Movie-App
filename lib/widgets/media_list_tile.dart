import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pMovie/constants/media_type.dart';
import 'package:pMovie/screens/movie_detail_screen.dart';
import 'package:pMovie/screens/series_detail_screen.dart';
import 'package:pMovie/services/api_service.dart';
import 'package:pMovie/view_models/media_view_model.dart';
import 'package:pMovie/view_models/movie_view_model.dart';
import 'package:pMovie/view_models/series_view_model.dart';
import 'package:provider/provider.dart';

class MediaListTile extends StatelessWidget {
  final MediaViewModel media;

  const MediaListTile({Key key, @required this.media}) : super(key: key);

  void _openMediaDetails(BuildContext context) {
    showBottomSheet(
      elevation: 10,
      context: context,
      builder: (context) => media.mediaType == MediaType.movie
          ? ChangeNotifierProvider(
              create: (context) => MovieViewModel(),
              child: MovieDetailScreen(
                id: media.id,
              ),
            )
          : ChangeNotifierProvider(
              create: (context) => SeriesViewModel(),
              child: SeriesDetailScreen(
                id: media.id,
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () => _openMediaDetails(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            dense: true,
            title: Text(media.title),
            subtitle: Text(DateFormat.yMMMd().format(media.releaseDate)),
            trailing: Image(
              image: NetworkImage(ApiService.posterUrl + media.posterPath),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
