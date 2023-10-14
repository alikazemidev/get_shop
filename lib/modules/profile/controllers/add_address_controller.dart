import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_shop/backend/models/address.dart';
import 'package:get_shop/backend/repositories/profile_repository.dart';
import 'package:get_shop/backend/response/province_response.dart';
import 'package:get_shop/helpers/widgets/snack_widget.dart';
import 'package:get_shop/modules/profile/controllers/address_controller.dart';

class AddAddressController extends GetxController {
  final Address? address;
  AddAddressController({this.address});

  var formKey = GlobalKey<FormState>();
  TextEditingController titleAddressInputController = TextEditingController();
  TextEditingController addressInuputController = TextEditingController();
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
    if (address != null) {
      selectedProvince = provinceResponse!.provinceData!.firstWhere(
        (element) => element.id == address!.provinceId!,
      );
      selectedCity = selectedProvince!.cities!.firstWhere(
        (element) => element.id == address!.cityId,
      );
    }
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
            address: addressInuputController.text,
            postalCode: postalCodeInputController.text,
            latlong: selectedPosition,
            cityId: selectedCity!.id!);
        if (res) {
          Get.find<AddressController>().getAddress();
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
    if (address != null) {
      titleAddressInputController.text = address!.title ?? '';
      addressInuputController.text = address!.address ?? '';
      postalCodeInputController.text = address!.postalCode.toString();
      selectedPosition = address!.latlong!;
      update();
    }
    super.onInit();
  }
}
