import 'package:flutter/material.dart';

class MyListDrawer extends StatefulWidget {
  const MyListDrawer({Key? key}) : super(key: key);

  @override
  State<MyListDrawer> createState() => _MyListDrawerState();
}

class _MyListDrawerState extends State<MyListDrawer> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Liked Wallpapers", Icons.favorite_border,
              currentPage == DrawerSections.dashboard ? true : false,Colors.pink,),
          menuItem(2, "QHD Auto Wallpaper", Icons.more_time_rounded,
              currentPage == DrawerSections.contacts ? true : false,Colors.brown,),
          menuItem(3, "Remove Ads", Icons.bookmark_remove_outlined,
              currentPage == DrawerSections.events ? true : false,Colors.indigo,),
          menuItem(4, "Notification", Icons.notifications_active_outlined,
              currentPage == DrawerSections.notes ? true : false,Colors.greenAccent,),

          menuItem(5, "Privacy Policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.settings ? true : false,Colors.orange,),
          menuItem(6, "More App", Icons.app_registration,
              currentPage == DrawerSections.notifications ? true : false,Colors.deepPurple,),
          menuItem(7, "Rate Us", Icons.star_border,
              currentPage == DrawerSections.privacy_policy ? true : false,Colors.amber,),
          menuItem(8, "Share", Icons.share,
              currentPage == DrawerSections.send_feedback ? true : false,Colors.lightGreenAccent,),
          Divider(),
        Container(
          margin: EdgeInsets.only(right: 200),
          child:   Text("Follow Us",style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold),),

        )
          ,menuItem(8, "Instagram", Icons.camera_alt_outlined,
            currentPage == DrawerSections.send_feedback ? true : false,Colors.purple),
          menuItem(8, "Facebook", Icons.facebook,
            currentPage == DrawerSections.send_feedback ? true : false,Colors.indigo,),
        ],
      ),
    );

  }

  Widget menuItem(int id, String title, IconData icon, bool selected,Color color) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color,

                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 20,),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,

}