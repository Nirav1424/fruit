// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Controller/CardController.dart';

class FavouritePage extends StatelessWidget {
  FavouritePage({super.key,  required this.index});
  final index;
  CardController cardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Page'),
      ),
      body: Container(
        child: ListView.builder(
                  itemCount: cardController.fav_list.length,
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
                                    cardController.fav_list[index].ProductImage),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(children: [
                                    TextSpan(
                                        text:
                                            '${cardController.fav_list[index].Price.toString()} \n'),
                                    TextSpan(
                                        text: cardController.fav_list[index].ProductName,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ]),
                                ),
                              ),
                            Icon(Icons.favorite,size: 30,),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  )
        
        
      ),
    );
  }
}
