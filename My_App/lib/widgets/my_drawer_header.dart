import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: 170,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            margin: EdgeInsets.only(bottom: 10),
            width: 100,
            height: 80,
            decoration: BoxDecoration(
              // shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage('assets/images/cover.jpg'),
              ),
            ),
          ),
          Text(
            "QHD Wallpapers",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Text(
            "Version: 1.4.7",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}