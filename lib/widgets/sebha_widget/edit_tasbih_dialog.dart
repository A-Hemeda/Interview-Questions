import '../../util/helpers.dart';
import 'tasbih_fields/tasbih_form.dart';
import '../../models/sebha_model.dart';
import '../../providers/sebha_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTasbih extends StatefulWidget {
  final String title;
  final SebhaModel tasbih;

  EditTasbih({
    this.title,
    this.tasbih,
  });

  @override
  _EditTasbihState createState() => _EditTasbihState();
}

class _EditTasbihState extends State<EditTasbih> {
  SebhaModel _tasbih;

  @override
  void initState() {
    _tasbih = widget.tasbih;
    super.initState();
  }

  Future<void> _editTasbih() async {
    await Provider.of<SebhaProvider>(context, listen: false)
        .updateItemFromSebha(_tasbih);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      child: TasbihForm(
        title: translate(context, 'sebha_edit_dialog'),
        tasbih: _tasbih,
        onChangedName: (value) => setState(() {
          _tasbih.setName = value;
        }),
        onChangedCounter: (value) => setState(() {
          _tasbih.setCounter = int.parse(value);
        }),
        onTapCancle: () => Navigator.of(context).pop(false),
        onTapDone: () async {
          await _editTasbih();
          Navigator.of(context).pop(true);
        },
      ),
    );
  }
}
