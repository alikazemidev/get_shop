import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_shop/backend/repositories/profile_repository.dart';
import 'package:get_shop/backend/response/province_response.dart';
import 'package:get_shop/helpers/widgets/snack_widget.dart';

class AddAddressController extends GetxController {
  var formKey = GlobalKey<FormState>();
  TextEditingController titleAddressInputController = TextEditingController();
  TextEditingController AddressInuputController = TextEditingController();
  TextEditingController postalCodeInputController = TextEditingController();

  ProfileRepository profileRepository = ProfileRepository();
  ProvinceResponse? provinceResponse;
  Province? selectedProvince;
  City? selectedCity;
  String? selectedPosition;

  String? titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا عنوان آدرس را وارد کنید';
    }
    return null;
  }

  String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا آدرس را وارد کنید';
    }
    return null;
  }

  Future<void> getProvinces() async {
    provinceResponse = await profileRepository.getProvinces();
    update();
  }

  void selectProvince(Province value) {
    selectedProvince = value;
    update();
  }

  void selectCity(City value) {
    selectedCity = value;
    update();
  }

  void selectPosition(String value) {
    selectedPosition = value;
    update();
  }

  Future<void> addAddress() async {
    if (formKey.currentState!.validate()) {
      if (selectedCity != null) {
        var res = await profileRepository.addAddress(
            title: titleAddressInputController.text,
            address: AddressInuputController.text,
            postalCode: postalCodeInputController.text,
            latlong: selectedPosition,
            cityId: selectedCity!.id!);
        if (res) {
          Get.back();
          successMessage('موفق', 'آدرس با موفقیت ثبت شد');
        }
      } else {
        errorMessage('خطا', 'لطفا استان و شهر خود را انتخاب کنید');
      }
    } else {
      print('not validate');
    }
  }

  @override
  void onInit() {
    getProvinces();
    super.onInit();
  }
}
