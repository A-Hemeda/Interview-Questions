import 'package:azkark/util/navigate_between_pages/size_route.dart';
import '../../providers/settings_provider.dart';
import '../../providers/favorites_provider.dart';
import '../../providers/sebha_provider.dart';
import 'package:provider/provider.dart';
import '../../pages/sebha/tasbih_page.dart';
import '../../models/sebha_model.dart';
import '../../util/colors.dart';
import 'package:flutter/material.dart';
import 'pop_up_menu.dart';
import '../../util/helpers.dart';

class Tasbih extends StatefulWidget {
  final SebhaModel tasbih;
  final int number;

  Tasbih({
    this.tasbih,
    this.number,
  });

  @override
  _TasbihState createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      color: teal[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        highlightColor: teal[100],
        splashColor: teal[100],
        borderRadius: BorderRadius.circular(10),
        onTap: () =>
            Navigator.push(context, SizeRoute(page: SebhaPage(widget.tasbih))),
        onLongPress: _showModalBottomSheet,
        onDoubleTap: () => copyText(context, widget.tasbih.name),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildNumberField(),
                Row(
                  children: <Widget>[
                    _buildFavoriteButton(),
                    _buildMenuButton(),
                  ],
                ),
              ],
            ),
            _buildNameField(),
            _buildBottomWidget(size),
          ],
        ),
      ),
    );
  }

  void _showModalBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext buildContext) {
        return PopUpMenuSebha(
          tasbih: widget.tasbih,
          buildContext: context,
        );
      },
    );
  }

  Widget _buildMenuButton() {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        highlightColor: teal[400].withAlpha(100),
        splashColor: teal[400],
        borderRadius: BorderRadius.circular(10),
        onTap: _showModalBottomSheet,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.more_vert,
            size: 22,
            color: teal,
          ),
        ),
      ),
    );
  }

  Widget _buildNumberField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: teal[200],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomLeft: Radius.circular(10))),
      child: Text(
        '${widget.number}',
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
    final settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        widget.tasbih.name,
        textAlign: TextAlign.center,
        style: new TextStyle(
          color: teal,
          fontFamily:
              settingsProvider.getsettingField('font_family').toString(),
          fontSize: settingsProvider.getsettingField('font_size'),
        ),
      ),
    );
  }

  Widget _buildFavoriteButton() {
    final sebhaProvider = Provider.of<SebhaProvider>(context, listen: false);
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        highlightColor: teal[400].withAlpha(100),
        splashColor: teal[400],
        borderRadius: BorderRadius.circular(10),
        onTap: () async {
          print('You clicked on Favorite');
          setState(() {
            widget.tasbih.favorite == 1
                ? widget.tasbih.setFavorite(0)
                : widget.tasbih.setFavorite(1);
          });
          await sebhaProvider.updateFavorite(
              widget.tasbih.favorite, widget.tasbih.id, widget.number - 1);
          if (widget.tasbih.favorite == 1)
            await Provider.of<FavoritesProvider>(context, listen: false)
                .addFavorite(2, widget.tasbih.id);
          else if (widget.tasbih.favorite == 0)
            await Provider.of<FavoritesProvider>(context, listen: false)
                .deleteFavorite(2, widget.tasbih.id);
        },
        child: Container(
          height: 35,
          width: 35,
          padding: EdgeInsets.all(5.0),
          child: Image.asset(
            widget.tasbih.favorite == 1
                ? 'assets/images/icons/favorites/favorite_128px.png'
                : 'assets/images/icons/favorites/nonfavorite_128px.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomWidget(Size size) {
    final settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: teal[200],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )),
      child: widget.tasbih.counter == 0
          ? Text(
              'عدد الحبات : بدون',
              style: new TextStyle(
                color: teal[700],
                fontWeight: FontWeight.w500,
                fontFamily:
                    settingsProvider.getsettingField('font_family').toString(),
                fontSize: settingsProvider.getsettingField('font_size'),
              ),
            )
          : Text(
              'عدد الحبات : ${widget.tasbih.counter}',
              style: new TextStyle(
                color: teal[700],
                fontFamily:
                    settingsProvider.getsettingField('font_family').toString(),
                fontSize: settingsProvider.getsettingField('font_size'),
              ),
            ),
    );
  }
}
