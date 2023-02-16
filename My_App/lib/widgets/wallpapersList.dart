import 'package:flutter/material.dart';

import '../models/wallpaper_model.dart';
import '../views/image_view.dart';

Widget wallpapersList({List<WallpaperModel>? wallpapers, context}) {
  return Container(
    margin: EdgeInsets.only(top:5),
    child: GridView.count(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 5),
      physics: ClampingScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 0.6,
      mainAxisSpacing: 3,
      crossAxisSpacing: 6.0,
      children: wallpapers!.map((wallpaper) {
        return GridTile(
          child:GestureDetector(
            onTap:()
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ImageView(
            imgUrl: wallpaper.src!.portrait,
          )
          ));
        },
            child: Container(
              // color: Colors.green,
                child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(wallpaper.src!.portrait ?? "",fit: BoxFit.cover,),
        ))));
        // child: Hero(
        //   tag: wallpaper.src.portrait,
        //   child: Container(
        //     child: ClipRRect(
        //         borderRadius: BorderRadius.circular(16),
        //         child: Image.network(wallpaper.src.portrait, fit: BoxFit.cover,)),
        //   ),
        // ),
        //   ),
        // );
      }).toList(),
    ),
  );
}
