import 'package:azkark/util/helpers.dart';
import '../../providers/sebha_provider.dart';
import '../../widgets/sebha_widget/tasbih.dart';
import '../../util/colors.dart';
import '../../providers/favorites_provider.dart';
import 'package:provider/provider.dart';
import '../../util/background.dart';
import 'package:flutter/material.dart';
import 'components/empty_favorite.dart';

class ViewFavoriteSebha extends StatefulWidget {
  @override
  _ViewFavoriteSebhaState createState() => _ViewFavoriteSebhaState();
}

class _ViewFavoriteSebhaState extends State<ViewFavoriteSebha> {
  @override
  Widget build(BuildContext context) {
    final sebhaProvider = Provider.of<SebhaProvider>(context, listen: false);
    final favoritesProvider =
        Provider.of<FavoritesProvider>(context, listen: false);

    return Stack(children: <Widget>[
      Background(),
      Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            translate(context, 'favorite_bar'),
            style: new TextStyle(
              color: teal[50],
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
        body: favoritesProvider.isEmpty(2)
            ? EmptyFavorite()
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: favoritesProvider.length(2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0)
                        : index == favoritesProvider.length(2) - 1
                            ? const EdgeInsets.only(
                                bottom: 5.0, left: 5.0, right: 5.0)
                            : const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Tasbih(
                      tasbih: sebhaProvider.getItemSebhaById(
                          favoritesProvider.getItemId(2, index)),
                      number: index + 1,
                    ),
                  );
                },
              ),
      ),
    ]);
  }
}
