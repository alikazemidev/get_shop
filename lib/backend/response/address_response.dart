import 'package:get_shop/backend/models/address.dart';

class AddressResponse {
  List<Address>? addressData;

  AddressResponse({this.addressData});

  AddressResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      addressData = <Address>[];
      json['data'].forEach((v) {
        addressData!.add(new Address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addressData != null) {
      data['data'] = this.addressData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

