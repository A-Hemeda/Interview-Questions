import '../../util/helpers.dart';
import '../../pages/search/search_azkar.dart';
import '../../util/navigate_between_pages/fade_route.dart';
import '../../widgets/search_widget/search_bar.dart';
import '../../util/navigate_between_pages/scale_route.dart';
import '../../pages/settings/settings_page.dart';
import '../../pages/asmaallah/view_asmaallah.dart';
import '../../pages/prayer/view_prayer.dart';
import '../../pages/categories/all_categories.dart';
import '../../pages/favorites/view_favorites.dart';
import '../../pages/sebha/items_sebha.dart';
import '../../util/background.dart';
import '../../models/section_model.dart';
import '../categories/categories_of_section.dart';
import '../../providers/sections_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../util/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sectionsProvider =
        Provider.of<SectionsProvider>(context, listen: false);

    return Stack(
      children: <Widget>[
        Background(),
        Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.teal,
            title: Text(
              translate(context, 'home_bar'),
              style: new TextStyle(
                color: Colors.teal[50],
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              SearchBar(
                title: '${translate(context, 'search_for_zekr')} . . . ',
                onTap: () => Navigator.push(
                    context,
                    FadeRoute(
                      page: SearchForZekr(),
                    )),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      _buildFirstList(context),
                      _buildAllAzkarCard('عرض كل الأذكار', context),
                      for (int i = 0; i < sectionsProvider.length; i += 2)
                        _buildRowCategories(sectionsProvider, i, context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFirstList(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.25,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: _buildItemsCard(
              context: context,
              text: translate(context, 'favorite_bar'),
              pathIcon: 'assets/images/icons/favorites/favorite_256px.png',
              onTap: () => Navigator.push(
                context,
                ScaleRoute(page: FavoritesView()),
              ),
            ),
          ),
          _buildItemsCard(
            context: context,
            text: translate(context, 'sebha_bar'),
            pathIcon: 'assets/images/icons/sebha/sebha_256px.png',
            onTap: () => Navigator.push(
              context,
              ScaleRoute(page: ItemsSebha()),
            ),
          ),
          _buildItemsCard(
            context: context,
            text: translate(context, 'prayer_bar'),
            pathIcon: 'assets/images/icons/prayer/prayer_256px.png',
            onTap: () => Navigator.push(
              context,
              ScaleRoute(page: ViewPrayer()),
            ),
          ),
          _buildItemsCard(
            context: context,
            text: translate(context, 'asmaallah_bar'),
            pathIcon: 'assets/images/icons/asmaallah/allah_256px.png',
            onTap: () => Navigator.push(
              context,
              ScaleRoute(page: ViewAsmaAllah()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: _buildItemsCard(
              context: context,
              text: translate(context, 'settings_bar'),
              pathIcon: '0',
              onTap: () => Navigator.push(
                context,
                ScaleRoute(page: Settings()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsCard(
      {BuildContext context, String text, String pathIcon, Function onTap}) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Card(
          color: teal[300],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            highlightColor: teal[400],
            borderRadius: BorderRadius.circular(10),
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.all(10.0),
              height: size.height * 0.1,
              width: size.width * 0.15,
              child: pathIcon == '0'
                  ? Icon(
                      Icons.settings,
                      color: Color(0xff414441),
                      size: size.width * 0.12,
                    )
                  : Image.asset(
                      pathIcon,
                      fit: BoxFit.contain,
                    ),
            ),
          ),
        ),
        Container(
          width: size.width * 0.18,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: new TextStyle(
              color: teal,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAllAzkarCard(String text, BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: teal[300],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          highlightColor: teal[400],
          borderRadius: BorderRadius.circular(10),
          onTap: () =>
              Navigator.push(context, FadeRoute(page: ViewAllCategories())),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 5.0),
                  height: size.height * 0.06,
                  child: Image.asset(
                    'assets/images/sections/8_128px.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
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
      ),
    );
  }

  Widget _buildRowCategories(
      SectionsProvider sectionsProvider, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildCategoryCard(sectionsProvider.getSection(index), context),
          _buildCategoryCard(sectionsProvider.getSection(index + 1), context),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(SectionModel sectionModel, BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      color: teal[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: size.height * 0.25,
        width: size.width * 0.45,
        child: InkWell(
          highlightColor: teal[400],
          borderRadius: BorderRadius.circular(10),
          onTap: () => Navigator.push(
            context,
            FadeRoute(page: CategoriesOfSection(sectionModel.id)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    // height: size.height*0.15,
                    width: size.width * 0.4,
                    child: Image.asset(
                      'assets/images/sections/' +
                          sectionModel.id.toString() +
                          '.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  sectionModel.name,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: teal,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
