import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/model/product.dart';
import 'package:shop_app/screen/card_item.dart';
import 'package:shop_app/screen/categrios.dart';
import 'package:shop_app/screen/detail_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefultPaddig),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefultPaddig),
          child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: kDefultPaddig,
                  mainAxisSpacing: kDefultPaddig),
              itemBuilder: (context, index) => ItemCard(
                    product: products[index],
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(product: products[index])));
                    },
                  )),
        ))
      ],
    );
  }
}
