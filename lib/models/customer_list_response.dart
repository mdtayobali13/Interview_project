import 'package:flutter_getx_project_template/models/customer_model.dart';
import 'package:flutter_getx_project_template/models/page_info_model.dart';

class CustomerListResponse {
  final int? success;
  final bool? error;
  final List<CustomerModel> customerList;
  final PageInfoModel pageInfo;

  CustomerListResponse({
    this.success,
    this.error,
    required this.customerList,
    required this.pageInfo,
  });

  factory CustomerListResponse.fromJson(Map<String, dynamic> json) {
    var rawList = json['CustomerList'];
    List<CustomerModel> customers = [];
    if (rawList is List) {
      customers =
          rawList
              .map(
                (item) => CustomerModel.fromJson(item as Map<String, dynamic>),
              )
              .toList();
    }

    return CustomerListResponse(
      success:
          json['Success'] is int
              ? json['Success']
              : int.tryParse(json['Success']?.toString() ?? ''),
      error: json['error'] as bool?,
      customerList: customers,
      pageInfo: PageInfoModel.fromJson(
        json['PageInfo'] as Map<String, dynamic>?,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Success': success,
      'error': error,
      'CustomerList': customerList.map((e) => e.toJson()).toList(),
      'PageInfo': pageInfo.toJson(),
    };
  }
}
