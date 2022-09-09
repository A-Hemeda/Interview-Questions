import 'package:azkark/util/colors.dart';
import 'package:azkark/util/helpers.dart';
import 'package:flutter/material.dart';

class TasbihTextField extends StatefulWidget {
  final String text, hintText, errorText;
  final int maxLines, maxlength;
  final ValueChanged<String> onSubmitted, onChanged;
  final bool isNumber, autoFocus, isFinalField;

  TasbihTextField({
    this.text,
    @required this.hintText,
    this.errorText,
    this.maxLines,
    this.maxlength,
    this.onSubmitted,
    this.onChanged,
    this.isNumber = false,
    this.isFinalField = false,
    this.autoFocus = false,
  });

  @override
  _TasbihTextFieldState createState() => _TasbihTextFieldState();
}

class _TasbihTextFieldState extends State<TasbihTextField> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);

    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: teal[100], borderRadius: BorderRadius.circular(10)),
      child: TextField(
        autofocus: widget.autoFocus,
        textDirection: isTextDirectionRTL(_controller.text)
            ? TextDirection.rtl
            : TextDirection.ltr,
        controller: _controller,
        maxLines: widget.maxLines,
        maxLength: widget.maxlength,
        cursorColor: teal[700],
        style: TextStyle(
          color: teal[600],
        ),
        onSubmitted: widget.onSubmitted,
        onChanged: widget.onChanged,
        textInputAction:
            widget.isFinalField ? TextInputAction.done : TextInputAction.next,
        keyboardType:
            widget.isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          errorText: widget.errorText,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: teal[400].withAlpha(175),
          ),
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          counterStyle: TextStyle(
            color: teal[400].withAlpha(175),
          ),
        ),
      ),
    );
  }
}
