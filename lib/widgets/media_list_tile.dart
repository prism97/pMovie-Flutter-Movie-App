import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pMovie/services/api_service.dart';
import 'package:pMovie/view_models/media_view_model.dart';

class MediaListTile extends StatelessWidget {
  final MediaViewModel media;

  const MediaListTile({Key key, @required this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
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
    );
  }
}
