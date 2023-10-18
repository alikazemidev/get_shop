import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/modules/products/screens/order_complete_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatelessWidget {
  final String paylink;
  PaymentScreen({super.key, required this.paylink});

  @override
  Widget build(BuildContext context) {
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            print(request.url);
            if (request.url.contains('order-complete')) {
              var uri = Uri.parse(request.url);
              Get.off(
                OrderCompleteScreen(
                  id: uri.queryParameters["id"] ?? '',
                  type: uri.queryParameters['type'] ?? '',
                ),
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(paylink));
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
