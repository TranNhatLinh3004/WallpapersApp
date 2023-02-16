import 'package:flutter/material.dart';
import 'package:my_app/widgets/search.dart';

import 'menu.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
// menu(),
      SizedBox(
        width: 60,
      ),
      Text(
        "QHD Wallpapers",
        style: TextStyle(
          fontSize: 20,
            color: Colors.white,
            fontFamily: 'Overpass',
            fontWeight: FontWeight.bold),
      ),
      SizedBox(
        width: 40,
      ),
     // search()
    ],
  );
}
