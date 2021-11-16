import 'package:flutter/material.dart';
import 'package:shop_app/screen/details_screen/components/card_counter.dart';

class CountterWithFavBtn extends StatelessWidget {
  const CountterWithFavBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CardCounter(),
        Container(
            padding: EdgeInsets.all(4),
            height: 32,
            width: 32,
            decoration:
                BoxDecoration(color: Color(0xffff6464), shape: BoxShape.circle),
            child: Icon(
              Icons.favorite_sharp,
              color: Colors.white,
            ))
      ],
    );
  }
}
