import '../../util/helpers.dart';
import '../../providers/settings_provider.dart';
import '../../providers/asmaallah_provider.dart';
import '../../widgets/asmaallah_widget/asmaallah.dart';
import 'package:provider/provider.dart';
import '../../util/background.dart';
import 'package:flutter/material.dart';
import 'components/not_found.dart';
import 'components/search_field.dart';

class SearchForAsmaAllah extends StatefulWidget {
  final List<String> searchItems;

  const SearchForAsmaAllah({
    this.searchItems,
  });

  @override
  _SearchForAsmaAllahState createState() => _SearchForAsmaAllahState();
}

class _SearchForAsmaAllahState extends State<SearchForAsmaAllah> {
  List<String> _history;
  String query;

  @override
  void initState() {
    super.initState();
    query = '';
    _history = List<String>();
    _history = [
      'الرحمن',
      'الرحيم',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Background(),
      Scaffold(
          appBar: AppBar(
            title: SearchField(
              title: '${translate(context, 'search_for_asmaallah')} . . . ',
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
            elevation: 0.0,
          ),
          body: buildSuggestions())
    ]);
  }

  Widget buildSuggestions() {
    final List<String> suggestions = query.isEmpty
        ? _history
        : widget.searchItems.where((word) => word.startsWith(query)).toList();

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
    final asmaAllahProvider =
        Provider.of<AsmaAllahProvider>(context, listen: false);

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
                child: AsmaAllah(
                  asmaallah: asmaAllahProvider.getAsmaAllah(asmaAllahProvider
                      .allAmaAllah
                      .indexOf(suggestions[index])),
                  fontSize:
                      Provider.of<SettingsProvider>(context, listen: false)
                          .getsettingField('font_size'),
                  showDescription: false,
                ),
              );
            });
  }
}
