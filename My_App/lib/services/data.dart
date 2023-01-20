import 'package:flutter/material.dart';
class Filter {

  String name;

  Filter(this.name);

}

List<Filter> getFilterList(){
  return <Filter>[
    Filter("CATEGORIES"),
    Filter("RECENT"),
    Filter("RANDOM"),
    Filter("WEEKLY POPULAR"),
    Filter("MONTHLY POPULAR"),
    Filter("MOST POPULAR"),

  ];
}


List<Tab> tabs = [
  Tab(child: Text("CATEGORIES")),
  Tab(child: Text("RECENT")),
  Tab(child: Text("RANDOM")),
  Tab(child: Text("WEEKLY POPULAR")),
  Tab(child: Text("MONTHLY POPULAR")),
  Tab(child: Text("MOST POPULAT")),
];