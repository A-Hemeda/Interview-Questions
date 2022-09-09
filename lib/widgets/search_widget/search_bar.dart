import '../../util/colors.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String title;
  final Function onTap;

  const SearchBar({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.teal[200],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          height: size.height * 0.055,
          decoration: BoxDecoration(
            color: Colors.teal[700],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.teal[50],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.teal[300],
                    fontSize: 13,
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
