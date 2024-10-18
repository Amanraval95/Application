import 'package:flutter/material.dart';
import 'package:new_app/models/catalog.dart';
import 'package:new_app/pages/home_detail_page.dart';

import 'package:new_app/widgets/home_widget/CataLogImage.dart';
import 'package:velocity_x/velocity_x.dart';

class CataLogList extends StatelessWidget {
  const CataLogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          splashColor: Colors.transparent,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(catalog: catalog),
            ),
          ),
          child: CataLogItem(
            catalog: catalog,
          ),
        );
      },
    );
  }
}

//                                                       HERE THE LIST IS DISPLAYED AND
class CataLogItem extends StatelessWidget {
  final Item catalog;

  const CataLogItem({super.key, required this.catalog})
  // ignore: unnecessary_null_comparison
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    final double deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    return VxBox(

      child: Row(
        children: [
          Hero(
              tag: (catalog.id.toString()),
              child: CataLogImage(image: catalog.image)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text
                    .minFontSize(17)
                    .bold
                    .color(context.theme.colorScheme.onPrimaryContainer)
                    .make()
                    .p1(),
                catalog.desc.text
                    .textStyle(context.captionStyle)
                    .color(context.theme.colorScheme.onPrimaryContainer)
                    .minFontSize(15)
                    .overflow(TextOverflow.ellipsis)
                    .maxLines(deviceHeight < 600 ? 1 : 2)
                    .make(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0,top: 8),
                  child: OverflowBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "\$${catalog.price}".text.xl.bold.make(),
                      ElevatedButton(
                        onPressed: () {},
                        child: "Buy".text.color(Colors.white).make(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    )
        .color(context.theme.colorScheme.primaryContainer)
        .square(140)
        .rounded
        .make()
        .p16();
  }
}

