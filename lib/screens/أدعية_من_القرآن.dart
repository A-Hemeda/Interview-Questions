import 'package:azkar_of_the_muslim/shared/item_design.dart';
import 'package:flutter/material.dart';
import '../data/أدعية_قرآنية.dart';

class Quran extends StatelessWidget {

  Quran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("أدعية قرآنية"),
            backgroundColor: Colors.teal,
          ),
          body: ListView.separated(
              itemBuilder: (context,index) => AzkarItem(model: quran[index]),
              separatorBuilder:(context,index) => const SizedBox(),
              itemCount: quran.length,),
      ),
    );
  }


}
