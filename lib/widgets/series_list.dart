import 'package:flutter/material.dart';
import 'package:pMovie/view_models/media_view_model.dart';
import 'package:pMovie/view_models/series_list_view_model.dart';
import 'package:pMovie/widgets/media_card.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SeriesList extends StatefulWidget {
  @override
  _SeriesListState createState() => _SeriesListState();
}

class _SeriesListState extends State<SeriesList> {
  @override
  void initState() {
    super.initState();
    Provider.of<SeriesListViewModel>(context, listen: false).fetchSeriesList();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SeriesListViewModel>(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Popular TV Series',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: (vm.seriesList == null || vm.seriesList.length == 0)
                ? _loadingListView()
                : _seriesListView(vm.seriesList),
          ),
        ],
      ),
    );
  }

  Widget _loadingListView() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
            child: Container(
              height: 250,
              width: 120,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _seriesListView(List<MediaViewModel> series) {
    return ListView.builder(
      physics: ScrollPhysics(),
      padding: EdgeInsets.all(10),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: series.length,
      itemBuilder: (context, index) {
        return MediaCard(
          media: series[index],
        );
      },
    );
  }
}
