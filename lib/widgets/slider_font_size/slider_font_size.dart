import '../../util/colors.dart';
import 'package:flutter/material.dart';

class SliderFontSize extends StatelessWidget {
  final double fontSize, min, max, divisions;
  final Function onChanged, onChangedEnd;
  final Color overlayColor;

  SliderFontSize({
    this.fontSize,
    this.min,
    this.max,
    this.divisions,
    this.overlayColor,
    this.onChanged,
    this.onChangedEnd,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(right: 5.0, left: 8.0),
      width: size.width * 0.8,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: overlayColor == null ? teal[100].withAlpha(175) : overlayColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: size.width * 0.7,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: teal[600],
                inactiveTrackColor: teal[300],
                trackShape: RoundedRectSliderTrackShape(),
                trackHeight: 4.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                thumbColor: teal[500],
                overlayColor: teal[900].withAlpha(15),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 14.0),
                tickMarkShape: RoundSliderTickMarkShape(),
                activeTickMarkColor: teal[600],
                inactiveTickMarkColor: teal[300],
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: teal[500],
                valueIndicatorTextStyle: TextStyle(
                  color: teal[100],
                  fontSize: fontSize,
                ),
              ),
              child: Slider(
                min: 14,
                max: 30,
                divisions: 8,
                label: '$fontSize',
                value: fontSize,
                onChanged: onChanged,
                onChangeEnd: onChangedEnd,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
