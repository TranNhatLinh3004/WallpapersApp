import 'dart:convert';

import 'package:flutter/material.dart';

import '../data/data.dart';
import '../models/wallpaper_model.dart';
import '../widgets/wallpapersList.dart';

import 'package:http/http.dart' as http;

class Recent extends StatefulWidget {
  const Recent({Key? key}) : super(key: key);

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  List<WallpaperModel>wallpapers = [];

  getTrendingWallpaper() async {
    var url = Uri.parse("https://api.pexels.com/v1/curated?page=2&per_page=40");
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
    super.initState();
    getTrendingWallpaper();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: wallpapersList(wallpapers: wallpapers,context: context),
    );
  }
}
