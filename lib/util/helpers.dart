import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../localization/app_localizations.dart';
import 'colors.dart';
import 'package:intl/intl.dart';

String translate(BuildContext context, String key) {
  return AppLocalizations.of(context).translate(key);
}

bool isTextDirectionRTL(String text) {
  if (text.isEmpty) return true;
  return Bidi.detectRtlDirectionality(text);
}

void copyText(BuildContext context, String text) {
  Clipboard.setData(ClipboardData(text: text));

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      translate(context, 'done_copy'),
      style: new TextStyle(
        color: teal[100],
        fontFamily: '0',
        fontSize: 14,
      ),
    ),
    backgroundColor: teal,
    duration: Duration(milliseconds: 500),
  ));
}
