import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/appbar_custom_widget.dart';
import 'package:get_shop/helpers/widgets/button_primary.dart';
import 'package:get_shop/modules/profile/controllers/address_controller.dart';
import 'package:get_shop/modules/profile/screens/add_address_screen.dart';
import 'package:iconsax/iconsax.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
        init: AddressController(),
        builder: (controller) {
          return Scaffold(
            appBar: getAppbar(title: 'آدرس ها'),
            body: controller.addressResponse == null
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Expanded(
                        child: controller
                                    .addressResponse!.addressData!.length ==
                                0
                            ? Center(
                                child: Text(
                                  'هنوز آدرسی ثبت نکردید',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.all(20),
                                itemCount: controller
                                    .addressResponse!.addressData!.length,
                                itemBuilder: (context, index) {
                                  var address = controller
                                      .addressResponse!.addressData![index];
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    padding: EdgeInsets.all(15),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: MyColors.dividreColor,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xff14489e)
                                              .withOpacity(.15),
                                          blurRadius: 3,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              address.title ?? '',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(AddAddressScreen(
                                                  address: address,
                                                ));
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color:
                                                        MyColors.dividreColor,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Icon(
                                                  Iconsax.edit,
                                                  color: MyColors.primaryColor,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            GestureDetector(
                                              onTap: () {
                                                controller
                                                    .deleteAddress(address.id!);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color:
                                                        MyColors.dividreColor,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Icon(
                                                  Iconsax.trash,
                                                  color: MyColors.primaryColor,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 25),
                                        Text(
                                          address.address ?? '',
                                          style: TextStyle(
                                            color: MyColors.darkGreyColor,
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        Visibility(
                                          visible: address.postalCode != null,
                                          child: Row(
                                            children: [
                                              Text(
                                                'کد پستی: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(address.postalCode
                                                  .toString()),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ButtonPrimary(
                          hasBorder: true,
                          text: 'آفزودن آدرس',
                          onPressed: () => Get.to(AddAddressScreen()),
                        ),
                      ),
                    ],
                  ),
          );
        });
  }
}
