// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Models/Product.dart';

import '../Controller/CardController.dart';

class AddItemPage extends StatelessWidget {
  final cardController = Get.put(CardController());

  AddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: GetX<CardController>(builder: (conntroller) {
              return ListView.builder(
                  itemCount: conntroller.cardItem.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 120,
                        child: Card(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    conntroller.cardItem[index].ProductImage),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(children: [
                                    TextSpan(
                                        text:
                                            '${conntroller.cardItem[index].Price.toString()} \n'),
                                    TextSpan(
                                        text: conntroller
                                            .cardItem[index].ProductName,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ]),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    cardController.removeProduct(
                                        conntroller.cardItem[index]);
                                  },
                                  icon: Icon(Icons.remove_circle)),
                              Text('1'),
                              IconButton(
                                  onPressed: () {
                                    cardController.addProduct(
                                        conntroller.cardItem[index]);
                                  },
                                  icon: Icon(Icons.add_circle)),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            })),
            cardDown(context)
          ],
        ),
      ),
    );
  }

  Container cardDown(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 60),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('subtotal'),
              ),
              Obx(() => Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('${cardController.totalPrice.toString()}'),
                  )),
            ],
          ),
          SizedBox(height: 5),
          Divider(height: 5),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('delivery fee'),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("18.0"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('total'),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Obx(() => Text('${cardController.total.toString()}')),
              ),
              //  Divider(),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                minimumSize: Size(size.width * 0.8, 50)),
            onPressed: () {},
            child: Obx(()=> Text('Continue to checkout   ${cardController.total.toString()}')),
          )
        ],
      ),
    );
  }
}
