import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/backend/models/address.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/appbar_custom_widget.dart';
import 'package:get_shop/helpers/widgets/button_primary.dart';
import 'package:get_shop/helpers/widgets/snack_widget.dart';
import 'package:get_shop/helpers/widgets/text_field_widget.dart';
import 'package:get_shop/modules/profile/controllers/add_address_controller.dart';
import 'package:get_shop/modules/profile/screens/map_screen.dart';

import 'package:get_shop/modules/profile/widgets/select_city_widget.dart';
import 'package:get_shop/modules/profile/widgets/select_province_widget.dart';

class AddAddressScreen extends StatelessWidget {
  final Address? address;
  const AddAddressScreen({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAddressController>(
        init: AddAddressController(address: address),
        builder: (controller) {
          return Scaffold(
            appBar:
                getAppbar(title: address == null ? 'ثبت آدرس' : 'ویرایش آدرس'),
            body: controller.provinceResponse == null
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          TextFieldWidget(
                            validator: controller.titleValidator,
                            textColor: MyColors.primaryColor,
                            hintText: 'عنوان آدرس',
                            inputController:
                                controller.titleAddressInputController,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(25))),
                                      context: context,
                                      builder: (context) {
                                        return SelectProvinceWidget(
                                          onSelected: (province) {
                                            controller.selectProvince(province);
                                          },
                                          provinces: controller
                                              .provinceResponse!.provinceData!,
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(13),
                                    // height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: MyColors.dividreColor,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          controller.selectedProvince == null
                                              ? 'استان'
                                              : controller
                                                  .selectedProvince!.name!,
                                          style: TextStyle(
                                            color:
                                                controller.selectedProvince ==
                                                        null
                                                    ? MyColors.hintColor
                                                    : MyColors.primaryColor,
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          CupertinoIcons.chevron_down,
                                          color: controller.selectedProvince ==
                                                  null
                                              ? MyColors.hintColor
                                              : MyColors.primaryColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    if (controller.selectedProvince != null) {
                                      showModalBottomSheet(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(25))),
                                        context: context,
                                        builder: (context) {
                                          return SelectCityWidget(
                                              onSelected: (city) {
                                                controller.selectCity(city);
                                              },
                                              cities: controller
                                                  .selectedProvince!.cities!);
                                        },
                                      );
                                    } else {
                                      errorMessage('خطا',
                                          'ابتدا استان مورد نظر را انتخاب بکنید');
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: MyColors.dividreColor,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          controller.selectedCity == null
                                              ? 'شهر'
                                              : controller.selectedCity!.name ??
                                                  '',
                                          style: TextStyle(
                                            color:
                                                controller.selectedCity == null
                                                    ? MyColors.hintColor
                                                    : MyColors.primaryColor,
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          CupertinoIcons.chevron_down,
                                          color: controller.selectedCity == null
                                              ? MyColors.hintColor
                                              : MyColors.primaryColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextFieldWidget(
                            validator: controller.addressValidator,
                            hintText: 'آدرس',
                            textColor: MyColors.primaryColor,
                            inputController: controller.addressInuputController,
                          ),
                          SizedBox(height: 10),
                          TextFieldWidget(
                            inputController:
                                controller.postalCodeInputController,
                            hintText: 'کد پستی',
                            textColor: MyColors.primaryColor,
                            type: TextInputType.number,
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () => Get.to(MapScreen(
                              onSelected: (positon) {
                                controller.selectPosition(positon);
                              },
                            )),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: MyColors.dividreColor,
                                ),
                              ),
                              child: Text(
                                controller.selectedPosition == null
                                    ? 'انتخاب موقعیت مکانی روی نقشه'
                                    : 'موقعیت مکانی انتخاب شد',
                                style: TextStyle(
                                  color: controller.selectedPosition == null
                                      ? MyColors.hintColor
                                      : MyColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ButtonPrimary(
                            text:
                                address == null ? 'افزودن آدرس' : 'ویرایش آدرس',
                            onPressed: controller.addOrEditAddress,
                          )
                        ],
                      ),
                    ),
                  ),
          );
        });
  }
}
