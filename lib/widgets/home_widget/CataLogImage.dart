import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class CataLogImage extends StatelessWidget {
  final String image;
  // ignore: unnecessary_null_comparison
  const CataLogImage({super.key, required this.image}) : assert(image != null);
  @override
  Widget build(BuildContext context) {
    return Image.asset(image)
        .box
        .rounded
        .p8
        .color(context.theme.colorScheme.onPrimary)
        .make()
        .p16()
        .w32(context);
  }
}
