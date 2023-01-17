import 'package:flutter/material.dart';

Widget menu() {
  return IconButton(
      icon: Icon(Icons.menu),
      color: Colors.green,
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