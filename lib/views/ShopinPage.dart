// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:getx/Controller/ShopingController.dart';

import '../Controller/CardController.dart';
import '../Models/Product.dart';
import 'AddItem.dart';

class ShopingPage extends StatelessWidget {
  // final shopingController = Get.put(ShopingController());
  final cardController = Get.put(CardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruite Apps'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child:  GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  itemCount: Product.products.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Container(
                        height: 290,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 90.0),
                                  child: Obx(()=>
                                     IconButton(
                                        onPressed: () {
                                          Product.products[index].isliked
                                              .toggle();
                                        },
                                        icon: Product.products[index].isliked.value
                                            ? Icon(Icons.favorite)
                                            : Icon(Icons.favorite_border)),
                                  ),
                                ),
                                Expanded(
                                  child: Image.network(
                                    '${Product.products[index].ProductImage}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  '${Product.products[index].ProductName}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${Product.products[index].Price}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: ElevatedButton(
                                              onPressed: () {
                                                 cardController.addProduct(
                                                    Product.products[index]);
                                              },
                                              child: Text('add')),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 264,
                  ),
                
              
              ),
            ),
            GetX<CardController>(builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(right :90.0),
                child: Text(
                  'total ${controller.totalPrice.toString()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.pink,
                  ),
                ),
              );
            }),
            const SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(AddItemPage());
        },
        icon: const Icon(
          Icons.add_shopping_cart,
        ),
        label: GetX<CardController>(builder: (controller) {
          return Text(controller.count.toString());
        }),
      ),
    );
  }
}
