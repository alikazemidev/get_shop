import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_shop/backend/models/category.dart';
import 'package:get_shop/backend/models/product.dart';
import 'package:get_shop/backend/repositories/product_repository.dart';

class ProductsListController extends GetxController {
  final int? categoryId;
  final Sort? defaultSort;
  ProductsListController({this.categoryId, this.defaultSort});

  Sort? selectedSort;
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
      orderColumn: selectedSort?.orderColumn,
      orderType: selectedSort?.orderType,
    );
    products = res.productsData;

    update();
  }

  void searchProducts(String value) {
    getProducts(searchText: value);
  }

  void sort(Sort sort) {
    selectedSort = sort;
    update();
    getProducts();
  }

  void selectCategory(int id) {
    selectedCategoryId = id;
    getProducts();
    update();
  }

  @override
  void onInit() {
    selectedCategoryId = categoryId;
    selectedSort = defaultSort;
    getCategories();
    getProducts();
    super.onInit();
  }
}

class Sort {
  final String? orderType;
  final String? orderColumn;

  Sort({
    required this.orderType,
    required this.orderColumn,
  });
}

// enum OrderType { price, discount }
//
// enum OrderColumn { DESC, ASC }
