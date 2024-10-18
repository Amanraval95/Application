// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/models/catalog.dart';
import 'package:new_app/utils/routes.dart';


import 'package:new_app/widgets/home_widget/CataLogList.dart';
import 'package:new_app/widgets/home_widget/CatalogHeader.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(Home_page());
}

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    try {
      var catalogJson =
          await rootBundle.loadString("assets/files/catalog.json");
      var decodedData = jsonDecode(
          catalogJson); // over here the data is presented in json formate will be converted in object  < map or list >
      var productsData = decodedData["products"];
      CatalogModel.items = List.from(productsData)
          .map<Item>((item) => Item.fromMap(item))
          .toList();
      setState(() {});
      _isLoading = false;
      // print(productsData);
    } catch (e) {
      print("Error decoding JSON: $e");
      // Handle the error here (e.g., display an error message to the user)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.onPrimary,
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.primaryColor,
        onPressed: () => Navigator.pushNamed(context, MyRoutes.CartRoute),
        child: Icon(CupertinoIcons.cart),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            children: [
              CatalogHeader(),
              if (_isLoading) CircularProgressIndicator().centered().expand(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CataLogList().py1().expand()
            ],
          ),
        ),
      ),
    );
  }
}
