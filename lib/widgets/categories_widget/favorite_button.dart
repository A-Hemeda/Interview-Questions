// import '../../util/colors.dart';
// import 'package:flutter/material.dart';

// class FavoriteButton extends StatefulWidget
// {
//   @override
//   _FavoriteButtonState createState() => _FavoriteButtonState();
// }

// class _FavoriteButtonState extends State<FavoriteButton> 
// {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       borderRadius: BorderRadius.circular(10),
//       child: InkWell(
//         highlightColor: ruby[400],
//         splashColor: ruby[400],
//         borderRadius: BorderRadius.circular(10),
//         onTap: () async {
//           print('You clicked on Favorite');
//           setState(() {
//             widget._category.favorite==1 ? widget._category.setFavorite(0) : widget._category.setFavorite(1);
//           });
//           await categoriesProvider.updateFavorite(widget._category.favorite,widget._category.id);
//           if(widget._category.favorite==1)
//             await Provider.of<FavoritesProvider>(context,listen: false).addFavorite(0,widget._category.id);
//           else if(widget._category.favorite==0)
//             await Provider.of<FavoritesProvider>(context,listen: false).deleteFavorite(0,widget._category.id);
//         },
//         child: Container(
//           height: 45,
//           width: 45,
//           padding:  EdgeInsets.all(5.0),
//           child: Image.asset(
//             widget._category.favorite==1 ? 
//             'assets/images/icons/favorites/favorite_128px.png'
//             : 'assets/images/icons/favorites/nonfavorite_128px.png' ,
//             fit: BoxFit.contain,
//           ),
//         ),
//       ),
//     );
//   }
// }