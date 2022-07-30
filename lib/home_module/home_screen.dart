import 'package:azkar_of_the_muslim/home_module/my_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const primaryColor = Colors.teal;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal,
          title: const Text(
            "أذكار المسلم",
          ),
        ),
        body: Column(
          children: [
            Image.asset(
              "assets/islamic3.jpg",
              width: double.infinity,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * .23,
            ),
            Expanded(
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(10),
                crossAxisCount: 3,
                crossAxisSpacing: 0.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: .8,
                children: [
                  MyGridItem(
                    onClick: () {
                      Navigator.pushNamed(context, '/Morning');
                    },
                    icon: Icons.sunny,
                    title: "أذكار الصباح",
                  ),
                  MyGridItem(
                    onClick: () {
                      Navigator.pushNamed(context, '/Evening');
                    },
                    icon: Icons.mode_night,
                    title: "أذكار المساء",
                  ),
                  MyGridItem(
                      onClick: () {
                        Navigator.pushNamed(context, '/WakingUp');
                      },
                      icon: Icons.alarm,
                      title: "الاستيقاظ"),
                  MyGridItem(
                      onClick: () {
                        Navigator.pushNamed(context, '/Sleep');
                      },
                      icon: Icons.bed,
                      title: "النوم"),
                  MyGridItem(
                      onClick: () {
                        Navigator.pushNamed(context, '/Home');
                      },
                      icon: Icons.home,
                      title: "المنزل"),
                  MyGridItem(
                      onClick: () {
                        Navigator.pushNamed(context, '/Eating');
                      },
                      icon: Icons.fastfood,
                      title: "الطعام"),
                  MyGridItem(
                      onClick: () {
                        Navigator.pushNamed(context, '/Prayer');
                      },
                      icon: Icons.mosque_outlined,
                      title: "الصلاة"),
                  MyGridItem(
                      onClick: () {
                        Navigator.pushNamed(context, '/Travel');
                      },
                      icon: Icons.directions_bus,
                      title: "السفر"),
                  MyGridItem(
                      onClick: () {
                        Navigator.pushNamed(context, '/Mosque');
                      },
                      icon: Icons.mosque,
                      title: "الآذان والمسجد"),
                  MyGridItem(
                      onClick: () {
                        Navigator.pushNamed(context, '/Nature');
                      },
                      icon: Icons.eco,
                      title: "الطبيعة"),
                  MyGridItem(
                      onClick: () {
                        Navigator.pushNamed(context, '/Problems');
                      },
                      icon: Icons.fireplace,
                      title: "المصائب"),
                  MyGridItem(
                      onClick: () {
                        Navigator.pushNamed(context, '/Other');
                      },
                      icon: Icons.add,
                      title: "أذكار متفرقة"),
                  MyGridItem(
                      onClick: () {
                        Navigator.pushNamed(context, '/Quran');
                      },
                      icon: Icons.book,
                      title: "أدعية قرآنية"),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
