// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/CardController.dart';
import '../Models/Product.dart';
import 'AddItem.dart';
import 'FullPage.dart';

class ShopingPage extends StatelessWidget {
  
  TextEditingController SearchController = TextEditingController();
  final cardController = Get.put(CardController());

  ShopingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruite Apps'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                  controller: SearchController,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String value) {
                    print(value);
                    // setState(() {});
                  }),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5,
                  // mainAxisExtent: 264,
                ),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                itemCount: Product.products.length,
                itemBuilder: (context, index) {
                  if (SearchController.text.isEmpty) {
                    return inkwell(index);
                  } else if (Product.products[index].ProductName
                      .toLowerCase()
                      .contains(SearchController.text.toLowerCase())) {
                    return null;
                  }
                },
              ),
            ),
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

  inkwell(int index) {
    return InkWell(
      hoverColor: Colors.pink[200],
      onTap: () {
        Get.to(FullPage(
          index: index,
        ));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        child: Container(
          height: 290,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 90.0),
                    child: Obx(
                      () => IconButton(
                          onPressed: () {
                            cardController
                                .addToFavItem(Product.products[index]);
                            Product.products[index].isliked.toggle();
                            Product.products[index].isliked.value
                                ? cardController.addLike()
                                : cardController.unlike();
                          },
                          icon: Product.products[index].isliked.value
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border)),
                    ),
                  ),
                  Expanded(
                    child: Hero(
                      tag: Product.products[index].id,
                      child: Image.network(
                        '${Product.products[index].ProductImage}',
                        fit: BoxFit.fill,
                      ),
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
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  cardController
                                      .addProduct(Product.products[index]);
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
      ),
    );
  }
}
