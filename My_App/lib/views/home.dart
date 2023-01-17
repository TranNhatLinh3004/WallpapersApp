import 'package:flutter/material.dart';
import 'package:my_app/widgets/brandName.dart';

import '../widgets/navBar.dart';
import '../widgets/search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: NavBar(),
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: brandName(),
            elevation: 1,
          ),
        ));
  }
}
