// ignore_for_file: unnecessary_string_interpolations, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/CardController.dart';
import '../Models/Product.dart';
import 'AddItem.dart';
import 'FavouritePage.dart';
// import 'package:badges/badges.dart';

class FullPage extends StatelessWidget {
  FullPage({super.key, required this.index});
  // ignore: prefer_typing_uninitialized_variables
  final CardController cardController = Get.find();
  // ignore: prefer_typing_uninitialized_variables
  final index;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: appbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: size.height * 0.897,
            child: Stack(
              children: [
                downContainer(size),
                upcontainer(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      backgroundColor: Colors.pink,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Get.back();
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: Obx(
            () => Badge(
              
              label: Text(cardController.likes.toString()),
              child: IconButton(
                onPressed :() {
                       Get.to(FavouritePage(
                  index: index,
                ));
                },
             icon:Icon(   Icons.favorite, size: 30)),
            ),
          ),
        ),
        SizedBox(width: 30),
        Padding(
          padding: EdgeInsets.only(top: 8, right: 28),
          child: Badge(
            child: IconButton(
                onPressed: () {
                  Get.to(AddItemPage());
                },
                icon: Icon(Icons.shopping_cart, size: 30)),
            label: GetX<CardController>(builder: (controller) {
              return Text(controller.count.toString());
            }),
          ),
        ),
      ],
    );
  }

  Padding upcontainer(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.5,
            width: size.width * 0.9,
            child: Card(
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.7, top: 7),
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
                              ? Icon(
                                  Icons.favorite,
                                  size: 35,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  size: 30,
                                )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Center(
                        child: Image.network(
                      Product.products[index].ProductImage,
                      height: 275,
                      width: 250,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      Product.products[index].Price.toString(),
                    ),
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      Product.products[index].ProductName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
              // color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            //     decoration: const BoxDecoration(
            // borderRadius: BorderRadius.all(Radius.circular(50)),
            // ),
          ),
        ],
      ),
    );
  }

  Container downContainer(Size size) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.1),
      height: size.height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          )),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(top: size.height * 0.5, left: 10, right: 10),
              child: Text(
                  "Lorem Ipsum is simply text of the is printing and Lorem Ipsum has been the industry’s standard dummy text ever since the "),
            ),
          ),
          SizedBox(height: 0),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: InkWell(
              onTap: () {
                cardController.addProduct(Product.products[index]);
              },
              child: Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, size.height * 0.08)),
                    onPressed: () {
                      cardController.addProduct(Product.products[index]);
                    },
                    child: Text(
                      'add to card',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
