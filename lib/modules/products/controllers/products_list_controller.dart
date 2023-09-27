import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_shop/backend/models/category.dart';
import 'package:get_shop/backend/models/product.dart';
import 'package:get_shop/backend/repositories/product_repository.dart';

class ProductsListController extends GetxController {
  List<Category>? categories;
  List<Product>? products;
  TextEditingController inputController = TextEditingController();
  ProductRepository productRepository = ProductRepository();
  int? selectedCategoryId;

  Future<void> getCategories() async {
    var res = await productRepository.getCategories();
    categories = res.categoriesData;
    update();
  }

  Future<void> getProducts({String? searchText}) async {
    var res = await productRepository.fillterProducts(
      categoryId: selectedCategoryId,
      searchText: searchText,
    );
    products = res.productsData;
    update();
  }

  void searchProducts(String value) {
    getProducts(searchText: value);
  }

  void selectCategory(int id) {
    selectedCategoryId = id;
    getProducts();
    update();
  }

  @override
  void onInit() {
    getCategories();
    getProducts();
    super.onInit();
  }
}
