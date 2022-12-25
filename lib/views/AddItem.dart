// ignore_for_file: prefer_const_constructors

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
        title: Text('Add Item'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(child:  GetX<CardController>(
           
            builder: (conntroller) {
              return ListView.builder(
                    itemCount: conntroller.cardItem.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                  conntroller.cardItem[index].ProductImage
                                  ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child:
                                    Text(
                                conntroller.cardItem[index].Price.toString())),
                            IconButton(
                                onPressed: (){
                                   cardController
                                  .removeProduct(conntroller.cardItem[index]);
                                }
                                
                                , icon: Icon(Icons.remove_circle)),
                            Text('1'),
                            IconButton(
                                onPressed: (){
                                   cardController
                                  .addProduct(conntroller.cardItem[index]);
                                }, icon: Icon(Icons.add_circle)),
                          ],
                        ),
                      );
                   
              });
            }
          )),
        ],
      )),
    );
  }
}
