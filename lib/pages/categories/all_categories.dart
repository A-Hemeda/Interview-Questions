import 'package:azkark/util/helpers.dart';
import '../../widgets/categories_widget/category.dart';
import '../../providers/categories_provider.dart';
import 'package:provider/provider.dart';
import '../../util/background.dart';
import 'package:flutter/material.dart';
import 'components/app_bar.dart';

class ViewAllCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);

    return Stack(children: <Widget>[
      Background(),
      Scaffold(
        appBar: CustomAppBar(
          title: translate(context, 'all_categories'),
        ),
        body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: categoriesProvider.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: index == 0
                    ? const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0)
                    : index == categoriesProvider.length - 1
                        ? const EdgeInsets.only(
                            bottom: 5.0, left: 5.0, right: 5.0)
                        : const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Category(
                  categoriesProvider.getCategory(index),
                ),
              );
            }),
      ),
    ]);
  }
}
