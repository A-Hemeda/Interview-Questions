import '../../../util/helpers.dart';
import '../../../widgets/slider_font_size/button_font_size.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../util/colors.dart';
import 'package:flutter/material.dart';

enum PopUpMenu { ShowAllDescription, About }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool description, sliderFont;
  final Function onTapDescription, onTapFontButton;

  CustomAppBar({
    this.title,
    this.description,
    this.sliderFont,
    this.onTapDescription,
    this.onTapFontButton,
  });

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Text(
        translate(context, 'asmaallah_bar'),
        style: new TextStyle(
          color: teal[50],
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
      actions: <Widget>[
        ButtonFontSize(
          showSider: sliderFont,
          onTap: onTapFontButton,
        ),
        _buildPopUpMenu(context),
      ],
    );
  }

  Widget _buildPopUpMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: PopupMenuButton<PopUpMenu>(
        offset: Offset(0, 50),
        onSelected: (PopUpMenu result) async {
          switch (result) {
            case PopUpMenu.ShowAllDescription:
              onTapDescription();
              break;

            case PopUpMenu.About:
              break;
          }
        },
        itemBuilder: (context) => [
          _buildMenuItem(
            value: PopUpMenu.ShowAllDescription,
            text: description
                ? translate(context, 'popup_menu_asmaallah_true')
                : translate(context, 'popup_menu_asmaallah_false'),
            icon: FaIcon(
              description
                  ? FontAwesomeIcons.toggleOn
                  : FontAwesomeIcons.toggleOff,
              color: description ? teal[500] : teal,
              size: 20,
            ),
          ),
          _buildMenuItem(
            value: PopUpMenu.About,
            text: translate(context, 'about'),
            icon: Icon(
              Icons.help_outline,
              color: teal,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem<PopUpMenu> _buildMenuItem(
      {PopUpMenu value, bool enable = true, Widget icon, String text}) {
    return PopupMenuItem<PopUpMenu>(
      value: value,
      enabled: enable,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 150,
            alignment: Alignment.centerRight,
            child: Text(
              text,
              style: new TextStyle(
                color: enable ? teal[900] : teal[900].withAlpha(125),
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
          ),
          icon,
        ],
      ),
    );
  }
}
