import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/model/product.dart';
import 'package:shop_app/screen/details_screen/components/body.dart';
import 'package:shop_app/screen/details_screen/components/card_counter.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: detail_appBar(),
      body: DetailBody(
        product: product,
      ),
    );
  }

  AppBar detail_appBar() {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
            )),
        SizedBox(
          width: kDefultPaddig / 2,
        )
      ],
    );
  }
}
