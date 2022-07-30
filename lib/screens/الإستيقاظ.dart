import 'package:azkar_of_the_muslim/shared/item_design.dart';
import 'package:flutter/material.dart';
import '../data/أذكار_الإستيقاظ.dart';

class WakingUpAzkar extends StatelessWidget {

  WakingUpAzkar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("أذكار الإستيقاظ"),
            backgroundColor: Colors.teal,

          ),
          body: ListView.separated(
              itemBuilder: (context,index) => AzkarItem(model: wakingUp[index]),
              separatorBuilder:(context,index) => const SizedBox(),
              itemCount: wakingUp.length,),
      ),
    );
  }


}
