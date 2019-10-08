import 'package:flutter/material.dart';
import 'package:campus_mobile/ui/widgets/image_loader.dart';
import 'package:campus_mobile/core/models/news_model.dart';
import 'package:campus_mobile/ui/widgets/container_view.dart';
import 'package:campus_mobile/core/constants/app_constants.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key key, @required this.data, this.listSize})
      : super(key: key);

  final Future<NewsModel> data;
  final int listSize;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsModel>(
      future: data,
      builder: (context, snapshot) {
        return buildNewsList(snapshot, context);
      },
    );
  }

  Widget buildNewsList(AsyncSnapshot snapshot, BuildContext context) {
    if (snapshot.hasData) {
      final List<Item> listOfNews = snapshot.data.items;
      final List<Widget> newsTiles = List<Widget>();

      /// check to see if we want to display only a limited number of elements
      /// if no constraint is given on the size of the list then all elements
      /// are rendered
      var size;
      if (listSize == null)
        size = listOfNews.length;
      else
        size = listSize;
      for (int i = 0; i < size; i++) {
        final Item item = listOfNews[i];
        final tile = buildNewsTile(item, context);
        newsTiles.add(tile);
      }

      return listSize != null
          ? Flexible(
              child: Column(
                children:
                    ListTile.divideTiles(tiles: newsTiles, context: context)
                        .toList(),
              ),
            )
          : ContainerView(
              child: ListView(
                children:
                    ListTile.divideTiles(tiles: newsTiles, context: context)
                        .toList(),
              ),
            );
    } else {
      return Container();
    }
  }

  Widget buildNewsTile(Item newsItem, BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, RoutePaths.NewsDetailView,
            arguments: newsItem);
      },
      title: Text(
        newsItem.title,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        newsItem.description,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: ImageLoader(url: newsItem.image),
    );
  }
}
