import '../../util/helpers.dart';
import '../../providers/categories_provider.dart';
import '../../widgets/categories_widget/category.dart';
import 'package:provider/provider.dart';
import '../../util/background.dart';
import 'package:flutter/material.dart';
import 'components/not_found.dart';
import 'components/search_field.dart';

class SearchForZekr extends StatefulWidget {
  @override
  _SearchForZekrState createState() => _SearchForZekrState();
}

class _SearchForZekrState extends State<SearchForZekr> {
  List<String> _history, searchItems;
  String query;

  @override
  void initState() {
    super.initState();
    query = '';
    searchItems = Provider.of<CategoriesProvider>(context, listen: false)
        .allCategoriesName;
    _history = List<String>();
    _history = [
      'أذكار الاستيقاظ من النوم',
      'أذكار النوم',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Background(),
      Scaffold(
          appBar: AppBar(
            title: Hero(
              tag: 'search',
              child: SearchField(
                title: '${translate(context, 'search_for_zekr')} . . . ',
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
              ),
            ),
            elevation: 0.0,
          ),
          body: buildSuggestions())
    ]);
  }

  Widget buildSuggestions() {
    final List<String> suggestions = query.isEmpty
        ? _history
        : searchItems.where((word) => word.contains(query)).toList();

    return _WordSuggestionList(
      query: this.query,
      suggestions: suggestions,
    );
  }
}

class _WordSuggestionList extends StatelessWidget {
  final List<String> suggestions;
  final String query;

  const _WordSuggestionList({
    this.suggestions,
    this.query,
  });

  @override
  Widget build(BuildContext context) {
    final categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);

    return suggestions.length == 0
        ? NotFound()
        : ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: index == 0
                    ? const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0)
                    : index == suggestions.length - 1
                        ? const EdgeInsets.only(
                            bottom: 5.0, left: 5.0, right: 5.0)
                        : const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Category(
                  categoriesProvider.getCategory(categoriesProvider
                      .allCategoriesName
                      .indexOf(suggestions[index])),
                ),
              );
            });
  }
}
