import '../../providers/settings_provider.dart';
import '../../widgets/slider_font_size/slider_font_size.dart';
import '../../providers/favorites_provider.dart';
import '../../widgets/azkar_widget/zekr_card.dart';
import '../../providers/categories_provider.dart';
import '../../util/background.dart';
import '../../providers/azkar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/app_bar.dart';

class ViewAzkar extends StatefulWidget {
  @override
  _ViewAzkarState createState() => _ViewAzkarState();
}

class _ViewAzkarState extends State<ViewAzkar> {
  int onFavorite;
  bool showSliderFont, isCounterOpen, isDiacriticsOpen, isSanadOpen;
  double fontSize;
  List<int> counter;
  List<bool> showSanad;

  @override
  void initState() {
    super.initState();
    showSliderFont = false;
    counter = List<int>();
    showSanad = List<bool>();
    int id = Provider.of<AzkarProvider>(context, listen: false)
        .getZekr(0)
        .categoryId;
    onFavorite = Provider.of<CategoriesProvider>(context, listen: false)
        .getCategory(id)
        .favorite;
    isCounterOpen = Provider.of<SettingsProvider>(context, listen: false)
        .getsettingField('counter');
    isDiacriticsOpen = Provider.of<SettingsProvider>(context, listen: false)
        .getsettingField('diacritics');
    fontSize = Provider.of<SettingsProvider>(context, listen: false)
        .getsettingField('font_size');
    isSanadOpen = Provider.of<SettingsProvider>(context, listen: false)
        .getsettingField('sanad');

    for (int i = 0;
        i < Provider.of<AzkarProvider>(context, listen: false).length;
        i++) {
      counter.add(0);
      showSanad.add(isSanadOpen);
    }
  }

  String get title {
    return isDiacriticsOpen
        ? Provider.of<CategoriesProvider>(context, listen: false)
            .getCategory(Provider.of<AzkarProvider>(context, listen: false)
                .getZekr(0)
                .categoryId)
            .nameWithDiacritics
        : Provider.of<CategoriesProvider>(context, listen: false)
            .getCategory(Provider.of<AzkarProvider>(context, listen: false)
                .getZekr(0)
                .categoryId)
            .nameWithoutDiacritics;
  }

  Future<void> onTapFavorite() async {
    final azkarProvider = Provider.of<AzkarProvider>(context, listen: false);
    final categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    print('You clicked on Favorite');
    setState(() {
      onFavorite == 1 ? onFavorite = 0 : onFavorite = 1;
    });
    await categoriesProvider.updateFavorite(
        onFavorite, azkarProvider.getZekr(0).id);
    if (onFavorite == 1)
      await Provider.of<FavoritesProvider>(context, listen: false)
          .addFavorite(0, azkarProvider.getZekr(0).id);
    else if (onFavorite == 0)
      await Provider.of<FavoritesProvider>(context, listen: false)
          .deleteFavorite(0, azkarProvider.getZekr(0).id);
  }

  void onTapSanad() {
    setState(() {
      showSanad.fillRange(
          0,
          Provider.of<AzkarProvider>(context, listen: false).length,
          !isSanadOpen);
      isSanadOpen = !isSanadOpen;
    });
  }

  void onTapCounter() {
    setState(() {
      if (isCounterOpen)
        counter.fillRange(
            0, Provider.of<AzkarProvider>(context, listen: false).length, 0);
      isCounterOpen = !isCounterOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final azkarProvider = Provider.of<AzkarProvider>(context, listen: false);

    return Stack(children: <Widget>[
      Background(),
      Scaffold(
          appBar: CustomAppBar(
            title: title,
            favorite: onFavorite == 1,
            counter: isCounterOpen,
            diacritics: isDiacriticsOpen,
            sanad: isSanadOpen,
            sliderFont: showSliderFont,
            onTapFavorite: onTapFavorite,
            onTapSanad: onTapSanad,
            onTapCounter: onTapCounter,
            onTapDiacritics: () => setState(() {
              isDiacriticsOpen = !isDiacriticsOpen;
            }),
            onTapFontButton: () => setState(() {
              showSliderFont = !showSliderFont;
            }),
            onTapRefresh: () => setState(() {
              counter.fillRange(0, azkarProvider.length, 0);
            }),
          ),
          body: Stack(
            children: <Widget>[
              SizedBox(
                width: size.width,
                height: size.height,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: azkarProvider.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: index == 0
                          ? const EdgeInsets.only(
                              top: 12.0, bottom: 6.0, left: 12.0, right: 12.0)
                          : index == azkarProvider.length - 1
                              ? const EdgeInsets.only(
                                  top: 6.0,
                                  bottom: 12.0,
                                  left: 12.0,
                                  right: 12.0)
                              : const EdgeInsets.only(
                                  top: 6.0,
                                  bottom: 6.0,
                                  left: 12.0,
                                  right: 12.0),
                      child: Zekr(
                        zekr: azkarProvider.getZekr(index),
                        numberZekr: index + 1,
                        isCounterOpen: isCounterOpen,
                        isDiacriticsOpen: isDiacriticsOpen,
                        showSanad: showSanad[index],
                        counter: counter[index],
                        onTap: () {
                          setState(() {
                            if (counter[index] <
                                azkarProvider.getZekr(index).counterNumber)
                              counter[index]++;
                          });
                        },
                        onRefresh: () {
                          setState(() {
                            counter[index] = 0;
                          });
                        },
                        onSanad: () {
                          setState(() {
                            showSanad[index] = !showSanad[index];
                          });
                        },
                        fontSize: fontSize,
                      ),
                    );
                  },
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
          )),
    ]);
  }
}
