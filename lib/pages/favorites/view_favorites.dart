import 'package:azkark/util/helpers.dart';
import 'view_favorite_prayer.dart';
import 'view_favorite_sebha.dart';
import 'view_favorite_categories.dart';
import '../../util/colors.dart';
import '../../util/background.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatefulWidget {
  @override
  _FavoritesViewState createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              _buildItemsCard(
                  'assets/images/sections/8_128px.png', 'الأذكار', size),
              _buildItemsCard('assets/images/icons/prayer/prayer_256px.png',
                  'الأدعية', size),
              _buildItemsCard('assets/images/icons/sebha/sebha_256px.png',
                  'المسبحة الإلكترونية', size),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget _buildItemsCard(String pathIcon, String text, Size size) {
    return Card(
      margin: EdgeInsets.all(5),
      color: teal[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        highlightColor: teal[400],
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          if (text == 'الأذكار')
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return ViewFavoriteCategories();
              }),
            );
          else if (text == 'الأدعية')
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return ViewFavoritePrayer();
              }),
            );
          if (text == 'المسبحة الإلكترونية')
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return ViewFavoriteSebha();
              }),
            );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Row(
            children: <Widget>[
              Container(
                height: size.height * 0.08,
                child: Image.asset(
                  pathIcon,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 25.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: teal,
                    fontWeight: FontWeight.w700,
                    fontSize: size.width * 0.05,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
