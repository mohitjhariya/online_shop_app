import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  Product(
      {this.image,
      this.title,
      this.description,
      this.price,
      this.size,
      this.id,
      this.color});
}

List<Product> products = [
  Product(
    id: 1,
    title: "Office Code",
    price: 235,
    size: 12,
    description: loremIpsum(words: 45),
    image: "images/bag_1.png",
    color: Color(0xff3082AE),
  ),
  Product(
    id: 2,
    title: "Belt Bag",
    price: 255,
    size: 8,
    description: loremIpsum(words: 45),
    image: "images/bag_2.png",
    color: Color(0xffD3A984),
  ),
  Product(
      id: 3,
      title: "Hang Top",
      price: 234,
      size: 10,
      description: loremIpsum(words: 45),
      image: "images/bag_3.png",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Old Fashion",
      price: 234,
      size: 11,
      description: loremIpsum(words: 45),
      image: "images/bag_4.png",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Office Code",
      price: 234,
      size: 12,
      description: loremIpsum(words: 45),
      image: "images/bag_5.png",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: loremIpsum(words: 45),
    image: "images/bag_6.png",
    color: Color(0xFFAEAEAE),
  ),
];
