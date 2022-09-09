import 'package:azkark/util/helpers.dart';
import '../../util/background.dart';
import '../../widgets/settings_widget/setting_font_size.dart';
import '../../widgets/settings_widget/setting_font_type.dart';
import '../../widgets/settings_widget/settings_item.dart';
import 'package:flutter/cupertino.dart';
import '../../util/colors.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Background(),
      Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'الضبط',
            style: new TextStyle(
              color: teal[50],
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              _buildPublicSettings(),
              _buildAzkarSettingsCard(context),
              // _buildCommunicate(size)
            ],
          ),
        ),
      ),
    ]);
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      color: teal[50],
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(20)),
      border: Border.all(color: teal[600]),
    );
  }

  Widget _buildAzkarSettingsCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: _buildTitle('إعدادات الأذكار'),
          ),
          Container(
            decoration: _decoration(),
            child: Column(
              children: <Widget>[
                SettingsItem(
                  activeTitle: translate(context, 'popup_menu_counter_true'),
                  inactiveTitle: translate(context, 'popup_menu_counter_false'),
                  nameField: 'counter',
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                ),
                SettingsItem(
                  activeTitle: translate(context, 'popup_menu_diacritics_true'),
                  inactiveTitle:
                      translate(context, 'popup_menu_diacritics_false'),
                  nameField: 'diacritics',
                ),
                SettingsItem(
                  activeTitle: translate(context, 'popup_menu_sanad_true'),
                  inactiveTitle: translate(context, 'popup_menu_sanad_false'),
                  nameField: 'sanad',
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPublicSettings() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: _buildTitle('الإعدادات العامة'),
          ),
          Container(
            decoration: _decoration(),
            child: Column(
              children: <Widget>[
                SettingFontType(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                ),
                SettingFontSize(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Container(
      decoration: BoxDecoration(
        color: teal[600],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: Text(
          text,
          style: new TextStyle(
            color: teal[50],
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
