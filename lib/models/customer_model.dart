import 'package:flutter_getx_project_template/constant/api_constants.dart';
import 'package:flutter_getx_project_template/models/customer_model_parser.dart';

class CustomerModel {
  final int? id;
  final String? name;
  final String? email;
  final String? primaryAddress;
  final String? secoundaryAddress;
  final String? notes;
  final String? phone;
  final String? custType;
  final String? parentCustomer;
  final String? imagePath;
  final bool? isInActive;
  final double? totalDue;
  final String? lastSalesDate;
  final String? lastInvoiceNo;
  final String? lastSoldProduct;
  final double? totalSalesValue;
  final double? totalSalesReturnValue;
  final double? totalAmountBack;
  final double? totalCollection;
  final String? lastTransactionDate;
  final String? clinetCompanyName;

  CustomerModel({
    this.id,
    this.name,
    this.email,
    this.primaryAddress,
    this.secoundaryAddress,
    this.notes,
    this.phone,
    this.custType,
    this.parentCustomer,
    this.imagePath,
    this.isInActive,
    this.totalDue,
    this.lastSalesDate,
    this.lastInvoiceNo,
    this.lastSoldProduct,
    this.totalSalesValue,
    this.totalSalesReturnValue,
    this.totalAmountBack,
    this.totalCollection,
    this.lastTransactionDate,
    this.clinetCompanyName,
  });

  String get fullImageUrl => ApiConstants.getFullImageUrl(imagePath);

  String get customerTypeDisplay {
    if (custType == null || custType!.trim().isEmpty) return 'Standard';
    if (custType!.toUpperCase() == 'G') return 'General';
    if (custType!.toUpperCase() == 'L') return 'Local';
    return custType!;
  }

  String get formattedBalance =>
      totalDue == null ? '৳0.00' : '৳${totalDue!.toStringAsFixed(2)}';

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      CustomerModelParser.fromJson(json);

  Map<String, dynamic> toJson() => CustomerModelParser.toJson(this);
}
