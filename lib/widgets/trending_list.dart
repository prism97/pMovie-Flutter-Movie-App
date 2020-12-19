import 'package:flutter/material.dart';
import 'package:pMovie/view_models/media_view_model.dart';
import 'package:pMovie/view_models/trending_list_view_model.dart';
import 'package:pMovie/widgets/media_list_tile.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TrendingList extends StatefulWidget {
  @override
  _TrendingListState createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList> {
  @override
  void initState() {
    super.initState();
    Provider.of<TrendingListViewModel>(context, listen: false)
        .fetchTrendingList();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TrendingListViewModel>(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Trending Content',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            child: (vm.trendingList == null || vm.trendingList.length == 0)
                ? _loadingListView()
                : _trendingListView(vm.trendingList),
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
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
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

  Widget _trendingListView(List<MediaViewModel> trending) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10),
      shrinkWrap: true,
      itemCount: trending.length,
      itemBuilder: (context, index) {
        return MediaListTile(
          media: trending[index],
        );
      },
    );
  }
}
