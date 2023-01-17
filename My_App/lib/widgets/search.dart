import 'package:flutter/material.dart';

Widget search() {
  return IconButton(
    icon: Icon(Icons.search),
    color: Colors.white,
    onPressed: () {
      // showSearch(
      //     context: context,
      //     delegate: CustomSearch()
      // );
    },
    splashRadius: 17,
    splashColor: Colors.lightBlueAccent,

  );
}