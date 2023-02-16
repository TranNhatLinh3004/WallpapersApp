import 'package:flutter/material.dart';
import '../data/data.dart';

import '../models/cateories_model.dart';
import 'category.dart';
class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<CategorieModel> categories = [];

  void initState() {
    super.initState();
    categories = getCategories();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 667,
                child: TabBarView(children: <Widget>[
                  Container(
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          // for (var tab in tabs) {
                          //   if (tab == "CATEGORIES") {
                          /// Create List Item tile
                          return CategoriesTile(
                            title: categories[index].categorieName,
                            imgUrl: categories[index].imgUrl,
                          );
                          //   }
                          // }
                          // return Text("hi");

                        }
                    ),
                  ),
                ]))
          ]);

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
    return GestureDetector(
onTap: ()
    {
      Navigator.push(context, MaterialPageRoute(builder:(context) => Category(
        categoryName:title.toLowerCase()
      )));
    }
    ,
  child:    Container(
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
        ])));
  }
}


