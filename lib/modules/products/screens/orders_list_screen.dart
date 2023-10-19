import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/appbar_custom_widget.dart';
import 'package:get_shop/modules/products/controllers/orders_list_controller.dart';

class OrdersListScreen extends StatelessWidget {
  const OrdersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderStatus getStatus(String status) {
      if (status == 'پرداخت شده' || status == 'تحویل داده شده') {
        return OrderStatus(bgColor: Color(0xff2ac066), textColor: Colors.white);
      } else if (status == 'در حال پرداخت') {
        return OrderStatus(
            bgColor: Color(0xfffeebeb), textColor: Color(0xfff31a1a));
      } else {
        return OrderStatus(
            bgColor: MyColors.darkRedColor, textColor: Colors.white);
      }
    }

    return GetBuilder<OrdersListController>(
        init: OrdersListController(),
        builder: (controller) {
          return Scaffold(
            appBar: getAppbar(title: 'سفارشات'),
            body: controller.orderResponse == null
                ? Center(child: CircularProgressIndicator())
                : controller.orderResponse!.orderData!.length == 0
                    ? Center(
                        child: Text(
                          'هنوز سفارشی ثبت نکردید',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount: controller.orderResponse!.orderData!.length,
                        itemBuilder: (BuildContext context, int index) {
                          var order =
                              controller.orderResponse!.orderData![index];
                          return Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 12),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Color(0xffebebeb)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff787878).withOpacity(.09),
                                  blurRadius: 14,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'ارسال سفارش به :‌',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: MyColors.darkGreyColor,
                                      ),
                                    ),
                                    Text(
                                      order.address ?? '',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      'شماره سفارش: ',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      order.trackingCode ?? '',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                SizedBox(
                                  height: 50,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: order.products!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Stack(
                                        // alignment: Alignment.topLeft,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                left: BorderSide(
                                                  color: MyColors.dividreColor,
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                            child: Center(
                                              child: Image.network(
                                                order.products![index].image ??
                                                    '',
                                                // height: 40,
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible:
                                                order.products![index].count! >
                                                    1,
                                            child: Positioned(
                                              left: 10,
                                              top: 0,
                                              child: Container(
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  color: MyColors.primaryColor
                                                      .withOpacity(.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    order.products![index].count
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          MyColors.primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Text(
                                      order.products!.length.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      '‌قلم کالا',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: MyColors.darkGreyColor,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'قیمت سفارش: ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: MyColors.darkGreyColor,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          order.totalPrice.toString(),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'تومان',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: MyColors.darkGreyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 2),
                                      decoration: BoxDecoration(
                                        color:
                                            getStatus(order.status.toString())
                                                .bgColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        order.status ?? '',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              getStatus(order.status.toString())
                                                  .textColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
          );
        });
  }
}

class OrderStatus {
  final Color bgColor;
  final Color textColor;

  OrderStatus({
    required this.bgColor,
    required this.textColor,
  });
}
