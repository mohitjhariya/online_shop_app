import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/model/product.dart';
import 'package:shop_app/screen/details_screen/components/add_to_card.dart';
import 'package:shop_app/screen/details_screen/components/colors_or_colorDot.dart';
import 'package:shop_app/screen/details_screen/components/description.dart';
import 'package:shop_app/screen/details_screen/components/fav_batton.dart';
import 'package:shop_app/screen/details_screen/components/image_and_title.dart';
import 'package:shop_app/screen/details_screen/detail_screen.dart';

class DetailBody extends StatelessWidget {
  final Product product;

  const DetailBody({this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefultPaddig,
                      right: kDefultPaddig),
                  // height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(
                    children: [
                      ColorText(product: product),
                      SizedBox(
                        height: kDefultPaddig / 2,
                      ),
                      Description(product: product),
                      SizedBox(
                        height: kDefultPaddig / 2,
                      ),
                      CountterWithFavBtn(),
                      SizedBox(
                        height: kDefultPaddig / 2,
                      ),
                      AddCard(product: product)
                    ],
                  ),
                ),
                ProductTitelWithImage(product: product),
              ],
            ),
          )
        ],
      ),
    );
  }
}
