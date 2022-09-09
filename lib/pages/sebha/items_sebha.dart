import '../../util/helpers.dart';
import '../../widgets/sebha_widget/add_tasbih_dialog.dart';
import '../../widgets/sebha_widget/tasbih.dart';
import '../../providers/sebha_provider.dart';
import '../../util/background.dart';
import 'package:provider/provider.dart';
import '../../util/colors.dart';
import 'package:flutter/material.dart';

class ItemsSebha extends StatefulWidget {
  @override
  _ItemsSebhaState createState() => _ItemsSebhaState();
}

class _ItemsSebhaState extends State<ItemsSebha> {
  @override
  Widget build(BuildContext context) {
    final sebhaProvider = Provider.of<SebhaProvider>(
      context,
    );
    print('ItemsSebha => build');
    return Stack(children: <Widget>[
      Background(),
      Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            translate(context, 'sebha_bar'),
            style: new TextStyle(
              color: teal[50],
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.all(8.0),
              child: IconButton(
                color: teal[50],
                highlightColor: teal[700],
                splashColor: teal[700],
                padding: EdgeInsets.all(0.0),
                icon: Icon(Icons.add),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AddTasbih(
                      title: translate(context, 'sebha_add_dialog'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: sebhaProvider.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: index == 0
                  ? const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0)
                  : index == sebhaProvider.length - 1
                      ? const EdgeInsets.only(
                          bottom: 8.0, left: 8.0, right: 8.0)
                      : const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Tasbih(
                tasbih: sebhaProvider.getItemSebha(index),
                number: index + 1,
              ),
            );
          },
        ),
      ),
    ]);
  }
}
