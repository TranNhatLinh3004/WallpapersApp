import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/models/cateories_model.dart';
import 'package:my_app/models/wallpaper_model.dart';
import 'package:my_app/views/recent.dart';
import 'package:my_app/views/random.dart';

import 'package:my_app/views/search.dart';
import 'package:my_app/widgets/brandName.dart';

import '../data/data.dart';
import '../services/constants.dart';
import '../services/data.dart';
import '../widgets/navBar.dart';
import '../widgets/search.dart';
import 'categories.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  static const routeName = '/homepage';

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategorieModel> categories = [];


  // @override
  // void initState() {
  //   super.initState();
  // }

  List<Filter> filters = getFilterList();
  late Filter selectedFilter;


  @override
  void initState() {
    super.initState();
    // getTrendingWallpaper();
    categories = getCategories();
    setState(() {
      selectedFilter = filters[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
            drawer: NavBar(),
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: brandName(),
              elevation: 1,
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    right: 0,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.grey[400],
                    // style: IconS,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Search()));
                    },
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(30),
                child: TabBar(
                  indicatorColor: Colors.blue,
                  isScrollable: true,
                  tabs: tabs,
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                Categories(), //ff5722
                Recent(),
                Random()
              ],
            )));

    // Padding(
    //   padding: EdgeInsets.only(right: 75),
    //   child: ListView(
    //
    //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: buildFilters(),
    //   ),
    // ),
  }

// List<Widget> buildFilters() {
//   List<Widget> list = [];
//   for (var i = 0; i < filters.length; i++) {
//     list.add(buildFilter(filters[i]));
//   }
//   return list;
// }
//
// Widget buildFilter(Filter item) {
//   return GestureDetector(
//     onTap: () {
//       setState(() {
//         selectedFilter = item;
//       });
//     },
//     child: Container(
//       height: 50,
//       child: Stack(
//         children: <Widget>[
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: Container(
//               width: 30,
//               height: 3,
//               color:
//                   selectedFilter == item ? kPrimaryColor : Colors.transparent,
//             ),
//           ),
//           Center(
//             child: Text(
//               item.name,
//               style: GoogleFonts.catamaran(
//                 color:
//                     selectedFilter == item ? kPrimaryColor : Colors.grey[400],
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 3,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 20,
//           )
//         ],
//       ),
//     ),
//   );
// }
}

class CategoriesTile extends StatelessWidget {
  // const CategoriesTile({Key? key}) : super(key: key);
  final String imgUrl, title;

  CategoriesTile({required this.imgUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 5, top: 5),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              imgUrl,
              width: 470,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.black38,
                  width: 470,
                  height: 200,
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ))
        ]));
  }
}
