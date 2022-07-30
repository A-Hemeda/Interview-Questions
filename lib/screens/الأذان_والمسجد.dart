import 'package:azkar_of_the_muslim/shared/item_design.dart';
import 'package:flutter/material.dart';
import '../data/أذكار_الأذان_والمسجد.dart';

class MosqueAzkar extends StatelessWidget {

  MosqueAzkar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("أذكار الأذان والمسجد"),
            backgroundColor: Colors.teal,

          ),
          body: ListView.separated(
              itemBuilder: (context,index) => AzkarItem(model: mosque[index]),
              separatorBuilder:(context,index) => const SizedBox(),
              itemCount: mosque.length,),
      ),
    );
  }


}
