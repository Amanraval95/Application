import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final assestName = 'assets/images/profile.jpg';
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 7, 81, 10),
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 7, 81, 10)),
                accountName: Text("Aman Raval"),
                accountEmail: Text("Aman@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(assestName),
                )),
            ListTile(
              leading: Icon(
                size: 30.0,
                CupertinoIcons.home,
                color: Colors.black,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 20.8,
                  
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                size: 30.0,
                CupertinoIcons.profile_circled,
                color: Colors.black,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 20.8,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                size: 30.0,
                CupertinoIcons.mail,
                color: Colors.black,
              ),
              title: Text(
                "eMail",
                style: TextStyle(
                  fontSize: 20.8,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
