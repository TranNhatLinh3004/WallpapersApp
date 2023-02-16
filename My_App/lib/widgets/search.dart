import 'package:flutter/material.dart';

Widget search() {
  return IconButton(
    color: Colors.white,
    icon: Icon(Icons.search),
    onPressed: () {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => [])),
    },
    splashRadius: 17,
    splashColor: Colors.lightBlueAccent,

  );
}