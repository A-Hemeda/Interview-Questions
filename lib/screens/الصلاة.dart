import 'package:azkar_of_the_muslim/shared/item_design.dart';
import 'package:flutter/material.dart';
import '../data/أذكار_الصلاة.dart';

class PrayerAzkar extends StatelessWidget {

  PrayerAzkar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("أذكار الصلاة"),
            backgroundColor: Colors.teal,

          ),
          body: ListView.separated(
              itemBuilder: (context,index) => AzkarItem(model: Prayer[index]),
              separatorBuilder:(context,index) => const SizedBox(),
              itemCount: Prayer.length,),
      ),
    );
  }


}
