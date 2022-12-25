// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class Product {
  final int id;
  final String ProductName;
  final String ProductImage;
  final String ProductDescription;
  final double Price;

  Product({
    required this.id,
    required this.ProductName,
    required this.ProductImage,
    required this.ProductDescription,
    required this.Price,
  });
  final isliked = false.obs;
  final quantity = 1.obs;

  static List<Product> products = [
     Product(
        id: 1,
        ProductName: 'Oranges',
        ProductImage:
            'https://tse3.mm.bing.net/th?id=OIP.Q3uzPlSo9XCK3W-q5m4tGAHaFQ&pid=Api&P=0',
        ProductDescription: 'hey is product is frist',
        Price: 70),
    Product(
        id: 2,
        ProductName: 'Apples',
        ProductImage:
            'https://tse1.mm.bing.net/th?id=OIP.UXrKKmXr2xkeb33i3DpC8QHaHa&pid=Api&P=0',
        ProductDescription: 'hey is product is frist',
        Price: 50),
    Product(
        id: 3,
        ProductName: 'pominGranet',
        ProductImage:
            'https://tse2.mm.bing.net/th?id=OIP.8EVzd7XDVFPrDuNoXlH8ewHaF0&pid=Api&P=0',
        ProductDescription: 'hey is product is frist',
        Price: 90),
    Product(
        id: 4,
        ProductName: 'Graps',
        ProductImage:
            'https://tse1.mm.bing.net/th?id=OIP.phriGwIt8J04_xLWtBH8BAHaE9&pid=Api&P=0',
        ProductDescription: 'hey is product is frist',
        Price: 30),
    Product(
        id: 5,
        ProductName: 'Watermalan',
        ProductImage:
            'https://tse2.mm.bing.net/th?id=OIP.JdXFVGk89AFk-yYL4rd2pQHaHa&pid=Api&P=0',
        ProductDescription: 'hey is product is frist',
        Price: 80),
    Product(
        id: 6,
        ProductName: 'banana',
        ProductImage:
            'https://tse2.mm.bing.net/th?id=OIP.9Wmp8sGf4lisu1VVNM3MUQHaFj&pid=Api&P=0',
        ProductDescription: 'hey is product is frist',
        Price: 40),
    Product(
        id: 7,
        ProductName: 'Kivi',
        ProductImage:
            'https://tse2.mm.bing.net/th?id=OIP.pf--86bDgrn04SqS_-uw5gHaFj&pid=Api&P=0',
        ProductDescription: 'hey is product is frist',
        Price: 80),
    Product(
        id: 8,
        ProductName: 'Mango',
        ProductImage:
            'https://tse3.mm.bing.net/th?id=OIP.OUr_g4m8lhO6RB2hrlZt5wHaHa&pid=Api&P=0',
        ProductDescription: 'hey is product is frist',
        Price: 150),
  ];

}


