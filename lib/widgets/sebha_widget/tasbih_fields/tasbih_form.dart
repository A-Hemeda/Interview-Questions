import 'package:azkark/widgets/sebha_widget/tasbih_fields/row_button_dialog.dart';
import 'package:flutter/material.dart';
import 'tasbih_text_field.dart';
import '../../../util/helpers.dart';
import '../../../models/sebha_model.dart';
import '../../../util/colors.dart';

class TasbihForm extends StatelessWidget {
  final String title;
  final SebhaModel tasbih;
  final Function onTapCancle, onTapDone;
  final ValueChanged<String> onChangedName, onChangedCounter;

  TasbihForm({
    @required this.title,
    this.tasbih,
    @required this.onChangedName,
    @required this.onChangedCounter,
    @required this.onTapCancle,
    @required this.onTapDone,
  });

  bool get _isAdd => tasbih.id == -1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        _buildForm(context),
        _buildCloseButton(),
      ],
    );
  }

  Widget _buildCloseButton() {
    return Positioned(
      right: -16.0,
      top: -16.0,
      child: InkResponse(
        onTap: onTapCancle,
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

  Widget _buildForm(BuildContext context) {
    return Form(
      onWillPop: () async {
        return false;
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildTitle(),
            TasbihTextField(
              text: tasbih.name,
              hintText: translate(context, 'sebha_hint_text_tasbih'),
              maxlength: 250,
              maxLines: 2,
              autoFocus: true,
              onChanged: onChangedName,
              onSubmitted: (text) => FocusScope.of(context).nextFocus(),
            ),
            TasbihTextField(
              text: tasbih.counter.toString(),
              hintText: translate(context, 'sebha_hint_text_counter'),
              maxLines: 1,
              maxlength: 4,
              isNumber: true,
              isFinalField: true,
              onChanged: onChangedCounter,
              onSubmitted: (text) {
                FocusScope.of(context).unfocus();
              },
            ),
            RowButtons(
              titleFirst: translate(context, _isAdd ? 'add' : 'edit'),
              titleSecond: translate(context, 'cancle'),
              onTapFirst: onTapDone,
              onTapSecond: onTapCancle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        title,
        style: TextStyle(
          color: teal[700],
          fontSize: 16,
        ),
      ),
    );
  }
}
