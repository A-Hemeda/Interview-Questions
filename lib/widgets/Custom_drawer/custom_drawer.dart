import 'package:azkark/util/helpers.dart';
import '../../util/colors.dart';
import 'list_title_of_drawer.dart';
import 'package:provider/provider.dart';
import '../../providers/sections_provider.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final double maxWidth, minWidth;
  final Function onTap, onPressedIndex, onSwipeLeft, onSwipeRight;
  final int currentIndex;
  final AnimationController animationController;

  CustomDrawer({
    @required this.animationController,
    @required this.minWidth,
    @required this.maxWidth,
    @required this.onTap,
    @required this.onPressedIndex,
    @required this.currentIndex,
    this.onSwipeLeft,
    this.onSwipeRight,
  });

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  Animation<double> widthAnimation;
  Animation<double> shadowAnimation;
  int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    widthAnimation = Tween<double>(begin: widget.minWidth, end: widget.maxWidth)
        .animate(widget.animationController);
    shadowAnimation =
        Tween<double>(begin: 0, end: 0.4).animate(widget.animationController);
  }

  AnimationController get animationController => widget.animationController;

  double get minWidth => widget.minWidth;

  Function get onTap => widget.onTap;

  Function get onSwipeLeft => widget.onSwipeLeft;

  Function get onSwipeRight => widget.onSwipeRight;

  void onPressedIndex(int index) {
    setState(() {
      currentIndex = index;
    });
    widget.onPressedIndex(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sectionsProvider =
        Provider.of<SectionsProvider>(context, listen: false);

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, widget) {
        return Stack(
          children: <Widget>[
            if (widthAnimation.value != minWidth)
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: onTap,
                  child: Container(
                      width: size.width,
                      height: size.height,
                      color: teal[900].withOpacity(shadowAnimation.value)),
                ),
              ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: widthAnimation.value,
                color: teal,
                child: Column(
                  children: <Widget>[
                    DrawerListTitle(
                      onTap:
                          currentIndex == 8 ? onTap : () => onPressedIndex(8),
                      isSelected: currentIndex == 8,
                      title: translate(context, 'all_categories'),
                      pathIcon: currentIndex == 8
                          ? 'assets/images/sections/8_128px.png'
                          : 'assets/images/sections/8_white_108px.png',
                      animationController: animationController,
                    ),
                    Divider(
                      color: teal[100].withAlpha(50),
                      thickness: 2,
                      height: 10.0,
                      indent: 7.5,
                      endIndent: 7.5,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: sectionsProvider.length,
                        itemBuilder: (context, index) {
                          return DrawerListTitle(
                            onTap: currentIndex == index
                                ? onTap
                                : () => onPressedIndex(index),
                            isSelected: currentIndex == index,
                            title: sectionsProvider.getSection(index).name,
                            pathIcon: currentIndex == index
                                ? 'assets/images/sections/' +
                                    index.toString() +
                                    '_128px.png'
                                : 'assets/images/sections/' +
                                    index.toString() +
                                    '_white_108px.png',
                            animationController: animationController,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
