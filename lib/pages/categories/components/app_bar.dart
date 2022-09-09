import '../../../pages/search/search_azkar.dart';
import '../../../util/navigate_between_pages/fade_route.dart';
import '../../../util/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AnimationController animationController;
  final String title;
  final Function onTap;

  CustomAppBar({
    this.title,
    this.onTap,
    this.animationController,
  });

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height); //50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Text(
        title,
        style: new TextStyle(
          color: teal[50],
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      actions: <Widget>[
        Container(
          margin: const EdgeInsets.all(4.0),
          child: IconButton(
              color: teal[50],
              highlightColor: teal[700],
              splashColor: teal[700],
              padding: EdgeInsets.all(0.0),
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context, FadeRoute(page: SearchForZekr()));
              }),
        ),
        if (animationController != null) _buildMenuButton(),
      ],
    );
  }

  Widget _buildMenuButton() {
    return Padding(
      padding: EdgeInsets.only(left: 5.0),
      child: IconButton(
        highlightColor: teal[700],
        splashColor: teal[700],
        onPressed: onTap,
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: animationController,
          color: teal[50],
        ),
      ),
    );
  }
}
