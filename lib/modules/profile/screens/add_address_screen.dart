import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/appbar_custom_widget.dart';
import 'package:get_shop/helpers/widgets/button_primary.dart';
import 'package:get_shop/helpers/widgets/text_field_widget.dart';
import 'package:get_shop/modules/profile/screens/map_screen.dart';
import 'package:get_shop/modules/profile/widgets/select_province_widget.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(title: 'ثبت آدرس'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              TextFieldWidget(hintText: 'عنوان آدرس'),
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
                            return SelectProvinceWidget();
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
                              'استان',
                              style: TextStyle(
                                color: MyColors.hintColor,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              CupertinoIcons.chevron_down,
                              color: MyColors.hintColor,
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
                            'شهر',
                            style: TextStyle(
                              color: MyColors.hintColor,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            CupertinoIcons.chevron_down,
                            color: MyColors.hintColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFieldWidget(hintText: 'آدرس'),
              SizedBox(height: 10),
              TextFieldWidget(
                hintText: 'کد پستی',
                type: TextInputType.number,
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => Get.to(MapScreen(
                  onSelected: (positon) {
                    print(positon);
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
                    'انتخاب موقعیت مکانی روی نقشه',
                    style: TextStyle(
                      color: MyColors.hintColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ButtonPrimary(
                text: 'افزودن آدرس',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
