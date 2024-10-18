import "package:flutter/material.dart";
import 'package:new_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.theme.colorScheme.onPrimary,
      bottomNavigationBar: Container(
        color: context.theme.colorScheme.primaryContainer,
        child: OverflowBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.xl3.color(context.theme.colorScheme.onPrimaryContainer).bold.make().px12(),
            ElevatedButton(
              onPressed: () {},
              child: "Buy".text.color(context.theme.colorScheme.secondary).minFontSize(21).make(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black),
            ).wh(100, 45).px16().py12()
          ],
        ),
      ),
      body: SafeArea(
          bottom: true,
          child: Column(
            children: [
              Hero(
                tag: catalog.id.toString(),
                child: Image.asset(catalog.image),
              ).h32(context),
              Expanded(
                  child: VxArc(
                      height: 30,
                      arcType: VxArcType.convey,
                      edge: VxEdge.top,
                      child: Container(

                          color: context.theme.colorScheme.primaryContainer,
                          width: context.screenWidth,
                          child: Column(
                            children: [
                              catalog.name.text.xl4.bold
                                  .color(context.theme.colorScheme.onPrimaryContainer)
                                  .make(),
                              HeightBox(8),
                              catalog.desc.text
                                  .textStyle(context.captionStyle)
                                  .color(context.theme.colorScheme.onPrimaryContainer)
                                  .minFontSize(17)
                                  .make()
                            ],
                          ).p32())))
            ],
          )),
    );
  }
}
