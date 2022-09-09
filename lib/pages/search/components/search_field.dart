import 'package:azkark/util/colors.dart';
import 'package:azkark/util/helpers.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String title;

  const SearchField({
    this.title,
    this.onChanged,
  });

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 20.0, top: 20.0),
          padding: const EdgeInsets.only(bottom: 20.0, top: 20.0),
          width: size.width,
          decoration: BoxDecoration(
            color: teal[700],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        TextField(
          autofocus: true,
          controller: _textController,
          style: TextStyle(
            color: teal[50],
          ),
          textInputAction: TextInputAction.search,
          cursorColor: teal[200],
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: teal[50],
              ),
              suffixIcon: _textController.text.isNotEmpty
                  ? IconButton(
                      splashColor: teal[600],
                      highlightColor: teal[600],
                      onPressed: () {
                        print('You clicked on clear Text');
                        _textController.clear();
                        widget.onChanged(_textController.text);
                      },
                      padding: EdgeInsets.all(6),
                      tooltip: translate(context, 'delete'),
                      icon: Icon(
                        Icons.clear,
                        color: teal[50],
                        size: 20,
                      ),
                    )
                  : Container(
                      width: 0,
                      height: 0,
                    ),
              hintText: widget.title,
              hintStyle: TextStyle(color: teal[300], fontSize: 12)),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
