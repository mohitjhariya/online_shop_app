import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/model/product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final press;

  const ItemCard({this.product, this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefultPaddig),
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                  color: product.color,
                  borderRadius: BorderRadius.circular(16)),
              child:
                  Hero(tag: "${product.id}", child: Image.asset(product.image)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefultPaddig / 4),
            child: Text(
              product.title,
              style: TextStyle(color: kTextlightColor),
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
