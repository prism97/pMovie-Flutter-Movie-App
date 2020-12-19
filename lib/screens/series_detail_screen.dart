import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pMovie/models/tv_series.dart';
import 'package:pMovie/services/api_service.dart';
import 'package:pMovie/view_models/series_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SeriesDetailScreen extends StatefulWidget {
  final int id;

  const SeriesDetailScreen({Key key, @required this.id}) : super(key: key);

  @override
  _SeriesDetailScreenState createState() => _SeriesDetailScreenState();
}

class _SeriesDetailScreenState extends State<SeriesDetailScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SeriesViewModel>(context, listen: false).fetchSeries(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SeriesViewModel>(context);

    return Container(
      decoration: ShapeDecoration(
        shadows: [
          BoxShadow(color: Colors.grey, offset: Offset(0, -5), blurRadius: 5),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        color: Theme.of(context).accentColor,
      ),
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: vm.series == null
            ? _loadingDetails()
            : _displayDetails(vm.series, context),
      ),
    );
  }

  Widget _loadingDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Shimmer.fromColors(
        baseColor: Colors.brown[300],
        highlightColor: Colors.brown[100],
        child: Column(
          children: [
            Container(
              width: 140,
              height: 200,
              color: Colors.brown,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 160,
              height: 30,
              color: Colors.brown,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 100,
              height: 20,
              color: Colors.brown,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 50,
              height: 40,
              color: Colors.brown,
            ),
          ],
        ),
      ),
    );
  }

  Widget _displayDetails(TVSeries series, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: NetworkImage(ApiService.posterUrl + series.posterPath),
            height: 200,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            child: Text(
              series.name,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .overline
                  .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'First Air Date',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            DateFormat.yMMMd().format(series.firstAirDate),
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star_rate_rounded),
              Text(series.voteCount.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
