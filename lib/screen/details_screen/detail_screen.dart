import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/model/product.dart';

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

class AddCard extends StatelessWidget {
  const AddCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefultPaddig),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: kDefultPaddig),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: product.color)),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: product.color,
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: product.color,
                onPressed: () {},
                child: Text(
                  "Buy Now".toUpperCase(),
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

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

class CardCounter extends StatefulWidget {
  @override
  _CardCounterState createState() => _CardCounterState();
}

class _CardCounterState extends State<CardCounter> {
  int nubOfItem = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(
            icon: (Icons.remove),
            press: () {
              if (nubOfItem > 1) {
                setState(() {
                  nubOfItem--;
                });
              }
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefultPaddig / 2),
          child: Text(
            nubOfItem.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
            icon: (Icons.add),
            press: () {
              setState(() {
                nubOfItem++;
              });
            }),
      ],
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
        width: 40,
        height: 32,
        child: OutlineButton(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          onPressed: press,
          child: Icon(icon),
        ));
  }
}

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefultPaddig),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}

class ColorText extends StatelessWidget {
  const ColorText({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Color"),
              Row(
                children: [
                  ColorDot(
                    color: Color(0xFF356C95),
                    isSelected: true,
                  ),
                  ColorDot(
                    color: Color(0xFFF8C078),
                  ),
                  ColorDot(
                    color: Color(0xFFA29898),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: RichText(
              text: TextSpan(style: TextStyle(color: kTextColor), children: [
            TextSpan(text: 'Size\n'),
            TextSpan(
                text: '${product.size}',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold))
          ])),
        )
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorDot({Key key, this.color, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefultPaddig / 4, right: kDefultPaddig / 2),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: isSelected ? color : Colors.transparent)),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

class ProductTitelWithImage extends StatelessWidget {
  const ProductTitelWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefultPaddig),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // SizedBox(
          //   height: kDefultPaddig,
          // ),
          Row(
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: "Price\n"),
                TextSpan(
                    text: "\$${product.price}",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold))
              ])),
              SizedBox(
                width: kDefultPaddig,
              ),
              Expanded(
                  child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image, fit: BoxFit.fill),
              ))
            ],
          )
        ],
      ),
    );
  }
}
