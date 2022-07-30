import 'package:azkar_of_the_muslim/shared/item_design.dart';
import 'package:flutter/material.dart';
import '../data/أذكار_المصائب_والأحزان.dart';

class ProblemsAzkar extends StatelessWidget {

  ProblemsAzkar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("أذكار الهموم والأحزان"),
            backgroundColor: Colors.teal,

          ),
          body: ListView.separated(
              itemBuilder: (context,index) => AzkarItem(model: problems[index]),
              separatorBuilder:(context,index) => const SizedBox(),
              itemCount: problems.length,),
      ),
    );
  }


}
