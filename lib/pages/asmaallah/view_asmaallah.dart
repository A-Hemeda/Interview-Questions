import '../../util/helpers.dart';
import '../../pages/search/search_asmaallah.dart';
import '../../util/navigate_between_pages/fade_route.dart';
import '../../providers/settings_provider.dart';
import '../../widgets/search_widget/search_bar.dart';
import '../../widgets/slider_font_size/slider_font_size.dart';
import '../../widgets/asmaallah_widget/asmaallah.dart';
import '../../providers/asmaallah_provider.dart';
import 'package:provider/provider.dart';
import '../../util/background.dart';
import 'package:flutter/material.dart';
import 'components/app_bar.dart';

class ViewAsmaAllah extends StatefulWidget {
  @override
  _ViewAsmaAllahState createState() => _ViewAsmaAllahState();
}

enum PopUpMenu { ShowAllDescription, About }

class _ViewAsmaAllahState extends State<ViewAsmaAllah> {
  double fontSize;
  bool showSliderFont, showAllDescription;
  List<bool> showDescription;

  @override
  void initState() {
    super.initState();
    showSliderFont = false;
    showAllDescription = false;
    fontSize = Provider.of<SettingsProvider>(context, listen: false)
        .getsettingField('font_size');
    showDescription = List<bool>();
    for (int i = 0;
        i < Provider.of<AsmaAllahProvider>(context, listen: false).length;
        i++) showDescription.add(false);
  }

  void onTapDescription() {
    setState(() {
      showAllDescription = !showAllDescription;
      showDescription.fillRange(
          0,
          Provider.of<AsmaAllahProvider>(context, listen: false).length,
          showAllDescription);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final asmaAllahProvider =
        Provider.of<AsmaAllahProvider>(context, listen: false);

    return Stack(children: <Widget>[
      Background(),
      Scaffold(
        appBar: CustomAppBar(
          title: translate(context, 'asmaallah_bar'),
          description: showAllDescription,
          sliderFont: showSliderFont,
          onTapDescription: onTapDescription,
          onTapFontButton: () => setState(() {
            showSliderFont = !showSliderFont;
          }),
        ),
        body: Stack(
          children: <Widget>[
            SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                children: <Widget>[
                  SearchBar(
                    title:
                        '${translate(context, 'search_for_asmaallah')} . . . ',
                    onTap: () {
                      Navigator.push(
                          context,
                          FadeRoute(
                            page: SearchForAsmaAllah(
                              searchItems: asmaAllahProvider.allAmaAllah,
                            ),
                          ));
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: asmaAllahProvider.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: index == 0
                                ? const EdgeInsets.only(
                                    top: 5.0, left: 5.0, right: 5.0)
                                : index == asmaAllahProvider.length - 1
                                    ? const EdgeInsets.only(
                                        bottom: 5.0, left: 5.0, right: 5.0)
                                    : const EdgeInsets.only(
                                        left: 5.0, right: 5.0),
                            child: AsmaAllah(
                              asmaallah: asmaAllahProvider.getAsmaAllah(index),
                              fontSize: fontSize,
                              showDescription: showDescription[index],
                              onTap: () {
                                setState(() {
                                  showDescription[index] =
                                      !showDescription[index];
                                });
                              },
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            if (showSliderFont)
              Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SliderFontSize(
                    fontSize: fontSize,
                    min: 14,
                    max: 30,
                    onChanged: (value) {
                      setState(() {
                        fontSize = value;
                      });
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    ]);
  }
}
