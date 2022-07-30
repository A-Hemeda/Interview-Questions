import 'package:azkar_of_the_muslim/data/أذكار_المساء.dart';
import 'package:azkar_of_the_muslim/shared/item_design.dart';
import 'package:flutter/material.dart';

class EveningAzkar extends StatelessWidget {

  EveningAzkar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("أذكار المساء"),
            backgroundColor: Colors.teal,

          ),
          body: ListView.separated(
              itemBuilder: (context,index) => AzkarItem(model: eveningItems[index]),
              separatorBuilder:(context,index) => const SizedBox(),
              itemCount: eveningItems.length,),
      ),
    );
  }


}
