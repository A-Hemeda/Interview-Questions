import 'package:azkar_of_the_muslim/data/أذكار_الصباح.dart';
import 'package:azkar_of_the_muslim/shared/item_design.dart';
import 'package:flutter/material.dart';

class MorningAzkar extends StatelessWidget {

  MorningAzkar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("أذكار الصباح"),
            backgroundColor: Colors.teal,

          ),
          body: ListView.separated(
              itemBuilder: (context,index) => AzkarItem(model: morningItems[index]),
              separatorBuilder:(context,index) => const SizedBox(),
              itemCount: morningItems.length,),
      ),
    );
  }


}
