import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/data.dart';
import '../models/wallpaper_model.dart';
import '../widgets/brandName.dart';
import '../widgets/wallpapersList.dart';

class Category extends StatefulWidget {
  final String? categoryName;
  Category({this.categoryName});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<WallpaperModel>wallpapers = [];


  getTrendingWallpaper(String? categoryName) async {
    var url = Uri.parse("https://api.pexels.com/v1/search?query=$categoryName&page=2&per_page=40");
    var response = await http.get(url, headers: {"Authorization": apiKEY});
    print(response.body.toString());

    /*
      * Tạo một đối tượng Uri từ một chuỗi URL bằng hàm Uri.parse().
Gọi hàm http.get() để tải dữ liệu từ API. Trong đối số, bạn truyền vào đối tượng Uri đã tạo và một bộ headers có chứa khóa API.
Hàm http.get() trả về một đối tượng Response với thuộc tính body là nội dung của phản hồi từ API. Để in nội dung, bạn gọi toString() trên thuộc tính body.
      * */

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      /*
        Sử dụng hàm jsonDecode() để chuyển đổi chuỗi JSON từ biến response.body thành một đối tượng Map có tên jsonData.
Duyệt qua một mảng trong dữ liệu JSON bằng cách truy cập vào thuộc tính "photos" của đối tượng jsonData.
Sử dụng hàm forEach để duyệt qua từng phần tử trong mảng và in nội dung của mỗi phần tử bằng cách sử dụng hàm print.
       */
      // print(element);


      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
      //print(photosModel.toString()+ "  "+ photosModel.src.portrait);



    });
    setState(() {

    });
  }

  @override
  void initState() {
    getTrendingWallpaper(widget.categoryName);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var categoryName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  brandName() ,

      ),

      body: SingleChildScrollView(
        child:Container(
          child:Column(
            children: [
              SizedBox(height: 16,)
              ,wallpapersList(wallpapers:wallpapers,context:context)
            ],
          )
        )
      ),
    );
  }
}
