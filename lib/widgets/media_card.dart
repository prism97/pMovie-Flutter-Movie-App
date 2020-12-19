import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pMovie/services/api_service.dart';
import 'package:pMovie/view_models/media_view_model.dart';

class MediaCard extends StatelessWidget {
  final MediaViewModel media;

  const MediaCard({Key key, @required this.media}) : super(key: key);

  void _openMediaDetails() {}

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
          onTap: _openMediaDetails,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image(
                    image:
                        NetworkImage(ApiService.posterUrl + media.posterPath),
                    fit: BoxFit.contain,
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
