// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:new_app/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Image.asset(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
        ),
      ),
    );
  }
}
