import 'package:get/get.dart';

import '../Models/Product.dart';

class CardController extends GetxController {
  final _products = {}.obs;

  // Rx<RxList<Product>> _product = RxList<Product>().obs;
  final RxList<dynamic> _product = [].obs;
  get cardItem => _product;

  final isliked = false.obs;

  double get totalPrice => _product.fold(0, (sum, item) => sum + item.Price);

  void addProduct(Product product) {
    _product.add(product);
    // if (_products.containsKey(product)) {
    //   _products[product] += 1;
    // } else {
    //   _products[product] = 1;
    // }

    Get.snackbar(
      "Product added",
      "${product.ProductName} add to cart screen",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

   void removeProduct(Product product) {
    _product.remove(product);
  }

  int get count => _product.length;
}
