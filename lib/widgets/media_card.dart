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

class MediaCard extends StatelessWidget {
  final MediaViewModel media;

  const MediaCard({Key key, @required this.media}) : super(key: key);

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
    return Container(
      height: 250,
      width: 120,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: () => _openMediaDetails(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  media.posterPath != null
                      ? Image(
                          image: NetworkImage(
                              ApiService.posterUrl + media.posterPath),
                          fit: BoxFit.contain,
                        )
                      : Container(
                          width: 120,
                          height: 160,
                          color: Theme.of(context).primaryColor,
                        ),
                  Positioned(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 12,
                        ),
                        Text(
                          media.voteCount.toString(),
                          style: Theme.of(context).textTheme.overline.copyWith(
                                color: Colors.yellow,
                                fontSize: 9,
                              ),
                        ),
                      ],
                    ),
                    top: 10,
                    right: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Text(
                  media.title,
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 10),
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  DateFormat.yMMMd().format(media.releaseDate),
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      .copyWith(fontSize: 8),
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
