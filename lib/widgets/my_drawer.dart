import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  final imageUrl = "https://contents.bebee.com/users/id/kJSIs639b582ed38e0/_avatar-cRZI9-400.png";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // color: const Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                margin: EdgeInsets.all(0),
                currentAccountPicture: CircleAvatar(
                  // backgroundImage: AssetImage("assets/portrait1.jpg"),
                  backgroundImage: AssetImage("assets/portrait1.jpg"),
                ),
                accountName: Text("Md. Zayed Oyshik", style: TextStyle(color: Colors.black54),), 
                accountEmail: Text("zayedoyshik1@gmail.com", style: TextStyle(color: Colors.black54),),
              )
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home),
              title: Text("Home", style: TextStyle( fontSize: 20),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled),
              title: Text("My Profile", style: TextStyle( fontSize: 20),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail),
              title: Text("Mail", style: TextStyle( fontSize: 20),),
            ),
          ]
        ),
      ),
    );
  }
}