import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.onPrimary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.theme.colorScheme.onPrimaryContainer).make(),
      ),
      body: Column(
        children: [
          _CartList().p12().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}
class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          "\$999".text.color(context.theme.colorScheme.onPrimaryContainer).xl5.make(),
          50.widthBox,
          ElevatedButton(
              onPressed:(){
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "not yet".text.make() ));
              },
            style: ElevatedButton.styleFrom(
              backgroundColor:Colors.black,
            ),
              child: "Buy".text.color(Colors.white).xl.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context, index) =>
          ListTile(

            leading: Icon(Icons.done,color:context.theme.colorScheme.onPrimaryContainer ,),
            trailing: IconButton(
              onPressed: (){},
              icon: Icon(Icons.remove_circle_outline,color: context.theme.colorScheme.onPrimaryContainer,),
            ),
              title: _cart.items[index].name.text.make(),
          ),
    );
  }
}
