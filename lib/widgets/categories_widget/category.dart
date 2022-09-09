import '../../providers/settings_provider.dart';
import '../../util/navigate_between_pages/fade_route.dart';
import '../../providers/favorites_provider.dart';
import '../../pages/azkar/view_azkar.dart';
import '../../providers/azkar_provider.dart';
import '../../models/category_model.dart';
import '../../providers/categories_provider.dart';
import '../../util/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Category extends StatefulWidget {
  final CategoryModel _category;

  Category(this._category);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  double fontSize;

  @override
  void initState() {
    super.initState();
    fontSize = Provider.of<SettingsProvider>(context, listen: false)
            .getsettingField('font_size') -
        2;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    final azkarProvider = Provider.of<AzkarProvider>(context, listen: false);

    return Card(
      color: teal[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: size.width,
        child: InkWell(
          highlightColor: teal[100],
          borderRadius: BorderRadius.circular(10),
          onTap: () async {
            await azkarProvider.initialAllAzkar(
                categoriesProvider.getCategory(widget._category.id).azkarIndex);
            Navigator.push(context, FadeRoute(page: ViewAzkar()));
          },
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: _buildNameField(),
                    ),
                    _buildFavoriteButton(categoriesProvider)
                  ],
                ),
              ),
              // _buildBottomWidget(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    bool diacritics = Provider.of<SettingsProvider>(context, listen: false)
        .getsettingField('diacritics');
    return Text(
      diacritics
          ? widget._category.nameWithDiacritics
          : widget._category.nameWithoutDiacritics,
      style: new TextStyle(
        color: teal,
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
      ),
    );
  }

  Widget _buildFavoriteButton(CategoriesProvider categoriesProvider) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        highlightColor: teal[400],
        splashColor: teal[400],
        borderRadius: BorderRadius.circular(10),
        onTap: () async {
          print('You clicked on Favorite');
          setState(() {
            widget._category.favorite == 1
                ? widget._category.setFavorite(0)
                : widget._category.setFavorite(1);
          });
          await categoriesProvider.updateFavorite(
              widget._category.favorite, widget._category.id);
          if (widget._category.favorite == 1)
            await Provider.of<FavoritesProvider>(context, listen: false)
                .addFavorite(0, widget._category.id);
          else if (widget._category.favorite == 0)
            await Provider.of<FavoritesProvider>(context, listen: false)
                .deleteFavorite(0, widget._category.id);
        },
        child: Container(
          height: 45,
          width: 45,
          padding: EdgeInsets.all(5.0),
          child: Image.asset(
            widget._category.favorite == 1
                ? 'assets/images/icons/favorites/favorite_128px.png'
                : 'assets/images/icons/favorites/nonfavorite_128px.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
