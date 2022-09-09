import '../../util/helpers.dart';
import '../../widgets/Custom_drawer/custom_drawer.dart';
import '../../util/background.dart';
import '../../widgets/categories_widget/category.dart';
import '../../providers/sections_provider.dart';
import '../../providers/categories_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'components/app_bar.dart';

class CategoriesOfSection extends StatefulWidget {
  final int _sectionId;

  CategoriesOfSection(this._sectionId);

  @override
  _CategoriesOfSectionState createState() => _CategoriesOfSectionState();
}

class _CategoriesOfSectionState extends State<CategoriesOfSection>
    with SingleTickerProviderStateMixin {
  bool _isCollapsed;
  AnimationController _animationController;
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 225));
    _isCollapsed = false;
    _currentIndex = widget._sectionId;
  }

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  String get title => _currentIndex == 8
      ? translate(context, 'all_categories')
      : Provider.of<SectionsProvider>(context, listen: false)
          .getSection(_currentIndex)
          .name;

  void onTapDrawer() {
    setState(() {
      _isCollapsed = !_isCollapsed;
      _isCollapsed
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  Future<bool> _onBackPressed() {
    print('back');
    if (!_isCollapsed) return Future.value(true);

    onTapDrawer();
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sectionsProvider =
        Provider.of<SectionsProvider>(context, listen: false);
    final categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);

    return Stack(children: <Widget>[
      Background(),
      WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          appBar: CustomAppBar(
            animationController: _animationController,
            title: title,
            onTap: onTapDrawer,
          ),
          body: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: size.width * 0.85,
                  height: size.height,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: _currentIndex == 8
                            ? _buildListViewAllCategories(categoriesProvider)
                            : _buildListViewCategoriesOfSection(
                                sectionsProvider, categoriesProvider),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: CustomDrawer(
                  animationController: _animationController,
                  minWidth: size.width * 0.15,
                  maxWidth: size.width * 0.7,
                  currentIndex: _currentIndex,
                  onTap: onTapDrawer,
                  onPressedIndex: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget _buildListViewAllCategories(CategoriesProvider categoriesProvider) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: categoriesProvider.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: index == 0
                ? const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0)
                : index == categoriesProvider.length - 1
                    ? const EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0)
                    : const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Category(
              categoriesProvider.getCategory(index),
            ),
          );
        });
  }

  Widget _buildListViewCategoriesOfSection(SectionsProvider sectionsProvider,
      CategoriesProvider categoriesProvider) {
    return ListView.builder(
        // shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: sectionsProvider.getCategoriesIndex(_currentIndex).length,
        itemBuilder: (context, index) {
          return Padding(
            padding: index == 0
                ? const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0)
                : index ==
                        sectionsProvider
                                .getCategoriesIndex(_currentIndex)
                                .length -
                            1
                    ? const EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0)
                    : const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Category(
              categoriesProvider.getCategory(
                  sectionsProvider.getCategoriesIndex(_currentIndex)[index]),
            ),
          );
        });
  }
}
