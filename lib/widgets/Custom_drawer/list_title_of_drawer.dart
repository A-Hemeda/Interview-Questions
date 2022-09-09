import '../../util/colors.dart';
import 'package:flutter/material.dart';

class DrawerListTitle extends StatefulWidget {
  final String title, pathIcon;
  final AnimationController animationController;
  final bool isSelected;
  final Function onTap;

  DrawerListTitle(
      {@required this.title,
      @required this.pathIcon,
      @required this.animationController,
      this.isSelected = false,
      this.onTap});

  @override
  _DrawerListTitleState createState() => _DrawerListTitleState();
}

class _DrawerListTitleState extends State<DrawerListTitle> {
  Animation<double> fontSizeAnimation;

  @override
  void initState() {
    super.initState();
    fontSizeAnimation =
        Tween<double>(begin: 0, end: 16).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: size.height * 0.08,
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: widget.isSelected ? teal[50] : Colors.transparent,
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: <Widget>[
            Align(alignment: Alignment.centerRight, child: _buildNameSection()),
            Align(alignment: Alignment.centerLeft, child: _buildImageSection()),
          ],
        ),
      ),
    );
  }

  Widget _buildNameSection() {
    return Container(
      padding:
          widget.isSelected ? EdgeInsets.only(right: 5.0) : EdgeInsets.all(0.0),
      child: Text(
        '${widget.title}',
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: fontSizeAnimation.value,
          color: widget.isSelected ? teal[900] : teal[50],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Padding(
      padding: widget.isSelected ? EdgeInsets.all(0.0) : EdgeInsets.all(2.5),
      child: Image.asset(
        widget.pathIcon,
        fit: BoxFit.contain,
      ),
    );
  }
}
