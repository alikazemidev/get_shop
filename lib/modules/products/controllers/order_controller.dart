import 'package:get/get.dart';
import 'package:get_shop/backend/models/address.dart';
import 'package:get_shop/backend/repositories/product_repository.dart';
import 'package:get_shop/backend/repositories/profile_repository.dart';
import 'package:get_shop/backend/response/address_response.dart';
import 'package:get_shop/helpers/widgets/snack_widget.dart';
import 'package:get_shop/modules/products/controllers/cart_controller.dart';
import 'package:get_shop/modules/products/screens/payment_screen.dart';
import 'package:get_shop/modules/products/widgets/raido_box_widget.dart';

class OrderController extends GetxController {
  ProductRepository productRepository = ProductRepository();
  ProfileRepository profileRepository = ProfileRepository();
  AddressResponse? addressResponse;
  Address? selectedAddress;
  ShippingMethod? selectedMethod;

  Future<void> getAddress() async {
    addressResponse = await profileRepository.getAddress();
    update();
  }

  Future<void> deleteAddress(int id) async {
    var res = await profileRepository.deleteAddress(id: id);
    if (res) {
      addressResponse!.addressData!.removeWhere(
        (element) => element.id == id,
      );
      update();
      successMessage('موفق', 'آدرس مورد نظر حذف شد');
    } else {
      errorMessage('نا موفق', 'خطایی رخ داده است');
    }
  }

  void selectAddress(Address value) {
    selectedAddress = value;
    update();
  }

  void selectMethod(ShippingMethod method) {
    selectedMethod = method;
    update();
  }

  String getTotalPrice() {
    var totalPrice = int.parse(Get.find<CartController>()
        .cartResponse!
        .totalPrice!
        .replaceAll(',', ''));
    int shippingPrice = 0;
    if (selectedMethod != null) {
      shippingPrice = int.parse(selectedMethod!.price.replaceAll(',', ''));
    }

    var result = (totalPrice + shippingPrice).toString();
    return result;
  }

  Future<void> order() async {
    if (selectedAddress != null && selectedMethod != null) {
      var link = await productRepository.order(
        addressId: selectedAddress!.id!,
        shippingMethod: selectedMethod!.value,
      );
      Get.off(PaymentScreen(
        paylink: link,
      ));
    } else {
      errorMessage('ناموفق', 'لطفا ادرس و شیوه ارسال را انتخاب کنید');
    }
  }

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }
}
