import 'package:azkar_of_the_muslim/shared/item_design.dart';
import 'package:flutter/material.dart';
import '../data/أذكار_النوم.dart';

class SleepAzkar extends StatelessWidget {

  SleepAzkar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("أذكار النوم"),
            backgroundColor: Colors.teal,

          ),
          body: ListView.separated(
              itemBuilder: (context,index) => AzkarItem(model: sleep[index]),
              separatorBuilder:(context,index) => const SizedBox(),
              itemCount: sleep.length,),
      ),
    );
  }


}
