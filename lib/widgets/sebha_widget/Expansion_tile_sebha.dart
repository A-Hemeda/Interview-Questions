import 'package:azkark/util/colors.dart';
import 'package:flutter/material.dart';

class ExpansionTileSebha extends StatefulWidget {
  final Widget title, child;
  final ValueChanged<bool> onExpansionChanged;
  final bool initiallyExpanded;

  const ExpansionTileSebha({
    @required this.title,
    this.onExpansionChanged,
    this.child,
    this.initiallyExpanded = false,
  }) : assert(initiallyExpanded != null);

  @override
  _ExpansionTileSebhaState createState() => _ExpansionTileSebhaState();
}

class _ExpansionTileSebhaState extends State<ExpansionTileSebha>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _iconColorTween = ColorTween();

  AnimationController _controller;
  Animation<double> _heightFactor;
  Animation<double> _iconTurns;
  Animation<Color> _iconColor;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 250), vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));

    _isExpanded = PageStorage.of(context)?.readState(context) as bool ??
        widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    if (widget.onExpansionChanged != null)
      widget.onExpansionChanged(_isExpanded);
  }

  @override
  void didChangeDependencies() {
    _iconColorTween
      ..begin = teal[600]
      ..end = teal[50];
    super.didChangeDependencies();
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ClipRect(
          child: Align(
            heightFactor: _heightFactor.value,
            child: child,
          ),
        ),
        GestureDetector(
          onTap: _handleTap,
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: <Widget>[
                widget.title,
                RotationTransition(
                  turns: _iconTurns,
                  child: Icon(Icons.expand_more, color: _iconColor.value),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed ? null : widget.child,
    );
  }
}
