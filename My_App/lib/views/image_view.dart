import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import '../data/data.dart';
import '../widgets/bottom_menu.dart';
// import 'package:url_launcher/url_launcher.dart';

class ImageView extends StatefulWidget {
  final String? imgUrl;

  ImageView({this.imgUrl});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  List<NavigationItem> navigationItems = getNavigationItemList();

  // NavigationItem selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.black,
      // elevation: 10,
// foregroundColor: Colors.green,
      // centerTitle: true,
      //   title: Text("Search")
      ),
      body: Stack(children: <Widget>[
        Container(
          width: 100,
          height: 50,
          alignment: Alignment.topCenter,
          color: Colors.green,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        Hero(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(widget.imgUrl ?? "", fit: BoxFit.cover)),
          tag: widget.imgUrl ?? "",
        ),
        // Container(
        //   // color: Colors.green,
        //   // height: 700,
        //   alignment: Alignment.bottomCenter,
        //   margin: EdgeInsets.only(bottom: 50),
        //
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       // GestureDetector(
        //       //     onTap: () {
        //       //       _save();
        //       //     },
        //       //     child: Stack(children: [
        //       //       Container(
        //       //         height: 80,
        //       //         width: 283,
        //       //         decoration: BoxDecoration(
        //       //           borderRadius: BorderRadius.circular(10.0),
        //       //           color: Color(0xff1C1B1B).withOpacity(0.8),
        //       //         ),
        //       //       ),
        //       //       Container(
        //       //         height: 80,
        //       //         // color: Colors.red,
        //       //         width: 285,
        //       //
        //       //         padding: EdgeInsets.all(10),
        //       //         decoration: BoxDecoration(
        //       //             border: Border.all(color: Colors.white),
        //       //             borderRadius: BorderRadius.circular(10.0),
        //       //             gradient: LinearGradient(
        //       //                 colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)])),
        //       //         child: Column(
        //       //           children: [
        //       //             Text(
        //       //               "Set Wallpaper",
        //       //               style: TextStyle(
        //       //                   color: Colors.white70,
        //       //                   fontSize: 25,
        //       //                   fontWeight: FontWeight.w500),
        //       //             ),
        //       //             SizedBox(
        //       //               height: 1,
        //       //             ),
        //       //             Text(
        //       //               "Image will open in new tab to download",
        //       //               style:
        //       //                   TextStyle(fontSize: 15, color: Colors.white70),
        //       //             ),
        //       //           ],
        //       //         ),
        //       //       ),
        //       //       SizedBox(
        //       //         height: 60,
        //       //       ),
        //       //       // GestureDetector(
        //       //       //   onTap: () {
        //       //       //     Navigator.pop(context);
        //       //       //   },
        //       //       //   child: Text(
        //       //       //     "Cancel",
        //       //       //     style: TextStyle(color: Colors.white, fontSize: 20),
        //       //       //   ),
        //       //       // ),
        //       //     ]))
        //     ],
        //   ),
        // )
      ]),
      bottomNavigationBar:
      // BottomMenuBar()
Container(
  color: Colors.black,
    height: 70,
    child: Row(
      children: [
        Expanded(
          child: IconButton(
            icon: Icon(Icons.draw, color: Colors.pink),
            onPressed: () {

              // Navigator.of(context)
              //     .pushReplacementNamed(HomePage.routeName);
            },
          ),
        ),
        Expanded(
          child: IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.pink),
            onPressed: () {

              // Navigator.of(context)
              //     .pushReplacementNamed(History.routeName);
            },
          ),
        ),
        Expanded(
          child: IconButton(
            icon: Icon(Icons.file_download_outlined, color: Colors.pink),
            onPressed: () {
              // GestureDetector(
              // onTap: () {
              _save();
              // Navigator.of(context)
              //     .pushReplacementNamed(History.routeName);
            },
          ),
        ),
        Expanded(
          child: IconButton(
            icon: Icon(Icons.picture_in_picture_alt_outlined, color: Colors.pink),
            onPressed: () {

              // Navigator.of(context)
              //     .pushReplacementNamed(ListBook.routeName);
            },
          ),
        ),
        Expanded(
          child: IconButton(
            icon: Icon(Icons.share, color: Colors.pink),
            onPressed: () {

              // Navigator.of(context)
              //     .pushReplacementNamed(Profile.routeName);
            },
          ),
        ),

      ],


  ),
)
      // Container(
      //   height: 70,
      //   // width: 300,
      //
      //   // color: Colors.transparent,
      //   decoration: BoxDecoration(
      //     gradient:
      //         LinearGradient(colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)]),
      //
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(25),
      //       topRight: Radius.circular(25),
      //     ),
      //     // boxShadow: [
      //     //   BoxShadow(
      //     //     color: Colors.grey.withOpacity(0.2),
      //     //     spreadRadius: 8,
      //     //     blurRadius: 12,
      //     //     offset: Offset(0, 3),
      //     //   ),
      //     // ],
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: buildNavigationItems(),
      //   ),
      // ),
    );
  }

  _save() async {
    await _askPermission();
    var response = await Dio().get(widget.imgUrl ?? "",
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  // _askPermission() async {
  //   if (Platform.isIOS) {
  //     /*Map<PermissionGroup, PermissionStatus> permissions =
  //       */await PermissionHandler()
  //         .requestPermissions([PermissionGroup.photos]);
  //   } else {
  //     /* PermissionStatus permission = */await PermissionHandler()
  //         .checkPermissionStatus(PermissionGroup.storage);
  //   }
  // }

  _askPermission() async {
    try {
      PermissionStatus permissionStatus;
      if (Platform.isIOS) {
        // Y??u c???u quy???n truy c???p v??o ???nh tr??n iOS
        final permissions = await Permission.photos.request();
        permissionStatus = permissions;
      } else {
        // Y??u c???u quy???n truy c???p v??o b??? nh??? tr??n Android
        permissionStatus = await Permission.storage.request();
      }
      if (permissionStatus == PermissionStatus.granted) {
        // Quy???n truy c???p ???????c c???p
        // Th???c hi???n c??c h??nh ?????ng khi quy???n truy c???p ???????c c???p
      } else if (permissionStatus == PermissionStatus.denied) {
        // Quy???n truy c???p b??? t??? ch???i
        // Hi???n th??? th??ng b??o cho ng?????i d??ng ho???c y??u c???u l???i quy???n truy c???p
      } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
        // Quy???n truy c???p b??? t??? ch???i v??nh vi???n
        // Hi???n th??? th??ng b??o cho ng?????i d??ng ????? h?????ng d???n h??? c???p l???i quy???n truy c???p trong c??i ?????t thi???t b???
      }
    } catch (e) {
      // X??? l?? l???i khi y??u c???u quy???n truy c???p th???t b???i
    }
  }

  List<Widget> buildNavigationItems() {
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // selectedItem = item;
        });
      },
      child: Container(
        width: 50,
        child: Center(
          child: Icon(
            item.iconData,
            // color: selectedItem == item ? Colors.green : Colors.grey[400],
            size: 28,
          ),
        ),
      ),
    );
  }
}
