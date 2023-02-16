import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Search"),
        elevation: 1,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(5),
          child: Row(
            children: [
              // TextFormField(
              //   // onChanged: (value) => updateList(value),
              //   decoration: InputDecoration(
              //       prefixIcon:
              //       IconButton(
              //         icon: Icon(Icons.search),
              //         color: Colors.green,
              //         onPressed: ()  {
              //           // showSearch(
              //           //     context: context,
              //           //     delegate: CustomSearch()
              //           // );
              //         },
              //         splashRadius: 17,
              //         splashColor: Colors.green,
              //       ),
              //       filled: true,
              //       fillColor: Colors.black12,
              //       hintText: 'Search ',
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(30),
              //         borderSide: BorderSide.none,
              //       )
              //   ),
              // ),

              // IconButton(
              //   icon: Icon(
              //     Icons.navigate_before_rounded,
              //   ),
              //   color: Colors.white,
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   splashRadius: 17,
              //   splashColor: Colors.lightBlueAccent,
              // ),
              // SizedBox(
              //   width: 70,
              // ),
              // Text(
              //   "Continue Reading",
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.white
              //   ),
              // ),
            ],
          ),
        ),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: searchController,
            style: TextStyle(color: Colors.white,fontSize: 20),
            // onChanged: (value) => updateList(value),
            decoration: InputDecoration(
                prefixIcon:
                IconButton(

                  icon: Icon(Icons.search),
                  color: Colors.white,
                  onPressed: ()  {
                    // showSearch(
                    //     context: context,
                    //     delegate: CustomSearch()
                    // );
                  },
                  splashRadius: 17,
                  splashColor: Colors.white,
                ),
                filled: true,
                fillColor: Colors.black,

                hintText: 'Search by Tag ',
                hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide.none,
                )
            ),
          ),
          
          SizedBox(
            height: 15,
          ),
        ],
      ),
    ));
  }
}
