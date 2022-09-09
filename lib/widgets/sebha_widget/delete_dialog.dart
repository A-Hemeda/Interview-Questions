import '../../providers/favorites_provider.dart';
import '../../providers/sebha_provider.dart';
import '../../util/colors.dart';
import '../../util/helpers.dart';
import '../../widgets/sebha_widget/tasbih_fields/row_button_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteDialog extends StatelessWidget {
  final int tasbihId, tasbihFavorite;

  const DeleteDialog({
    this.tasbihId,
    this.tasbihFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildTitle(context),
              _buildSubTitle(context),
              RowButtons(
                titleFirst: translate(context, 'delete'),
                titleSecond: translate(context, 'cancle'),
                onTapFirst: () async {
                  if (tasbihFavorite == 1)
                    await Provider.of<FavoritesProvider>(context, listen: false)
                        .deleteFavorite(2, tasbihId);
                  await Provider.of<SebhaProvider>(context, listen: false)
                      .deleteItemFromSebha(tasbihId);
                  Navigator.of(context).pop(true);
                },
                onTapSecond: () => Navigator.of(context).pop(false),
              ),
            ],
          ),
          _buildCloseButton(context),
        ],
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Positioned(
      right: -16.0,
      top: -16.0,
      child: InkResponse(
        onTap: () => Navigator.of(context).pop(false),
        child: CircleAvatar(
          radius: 18,
          child: Icon(
            Icons.close,
          ),
          backgroundColor: teal[600],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        translate(context, 'sebha_delete_dialog_title'),
        style: TextStyle(
          color: teal[700],
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildSubTitle(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      child: Text(
        translate(context, 'sebha_delete_dialog_subtitle'),
        style: TextStyle(
          color: teal[500],
          fontSize: 16,
        ),
      ),
    );
  }
}
