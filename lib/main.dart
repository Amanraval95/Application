import 'package:flutter/material.dart';
import 'package:new_app/pages/cart_page.dart';
import 'package:new_app/utils/routes.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'theme.dart';

void main() {
  runApp(myfirstapp());
}

class myfirstapp extends StatelessWidget {
  myfirstapp({super.key});
  var lightColorTheme = MaterialTheme.lightScheme();
  var darkColorTheme = MaterialTheme.darkScheme();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(colorScheme: lightColorTheme),
      darkTheme: ThemeData(colorScheme: darkColorTheme), // ThemeData
      initialRoute: MyRoutes.Homeroute,
      routes: {
        // "/": (context) => Home_page(),
        MyRoutes.Loginroute: (context) => loginpage(),
        MyRoutes.Homeroute: (context) => Home_page(),
        MyRoutes.CartRoute: (context) => CartPage()
        //heyyy
      },
    ); // MaterialApp
  }
}
