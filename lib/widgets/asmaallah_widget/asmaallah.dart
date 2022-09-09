import '../../models/asmaallah_model.dart';
import '../../util/colors.dart';
import 'package:flutter/material.dart';

class AsmaAllah extends StatefulWidget {
  final AsmaAllahModel asmaallah;
  final double fontSize;
  final bool showDescription;
  final Function onTap;

  AsmaAllah({
    this.asmaallah,
    this.fontSize,
    this.showDescription,
    this.onTap,
  });

  @override
  _AsmaAllahState createState() => _AsmaAllahState();
}

class _AsmaAllahState extends State<AsmaAllah> {
  bool _showDescription;

  @override
  void initState() {
    _showDescription = widget.showDescription;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      color: teal[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: size.width,
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: teal[100],
          borderRadius: BorderRadius.circular(10),
          onTap: widget.onTap == null
              ? () {
                  setState(() {
                    _showDescription = !_showDescription;
                  });
                }
              : widget.onTap,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: _buildNumberField(size),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: Column(
                    children: <Widget>[
                      _buildNameField(),
                      Align(
                          alignment: Alignment.centerRight,
                          child: _buildDescriptionButton()),
                      if (widget.showDescription) _buildDescriptionField(size),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberField(Size size) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: teal[200],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomLeft: Radius.circular(10))),
      child: Text(
        '${widget.asmaallah.id}',
        textAlign: TextAlign.center,
        style: new TextStyle(
          color: teal[700],
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        widget.asmaallah.name,
        textAlign: TextAlign.center,
        style: new TextStyle(
          color: teal,
          fontWeight: FontWeight.w700,
          fontSize: widget.fontSize,
        ),
      ),
    );
  }

  Widget _buildDescriptionButton() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: widget.showDescription ? teal[200] : Colors.transparent,
        border: Border.all(color: teal[200]),
        borderRadius: widget.showDescription
            ? BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))
            : BorderRadius.circular(10),
      ),
      child: Text(
        'المعني',
        textAlign: TextAlign.center,
        style: new TextStyle(
          color: widget.showDescription ? teal[700] : teal[700],
          // fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildDescriptionField(Size size) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: teal[200],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.asmaallah.description,
          style: new TextStyle(
            color: teal[600],
            fontSize: widget.fontSize - 2,
          ),
        ),
      ),
    );
  }
}
