import 'package:flutter_getx_project_template/models/customer_model.dart';

class CustomerModelParser {
  static CustomerModel fromJson(Map<String, dynamic> json) => CustomerModel(
    id: _toInt(json['Id']),
    name: json['Name']?.toString(),
    email: json['Email']?.toString(),
    primaryAddress: json['PrimaryAddress']?.toString(),
    secoundaryAddress: json['SecoundaryAddress']?.toString(),
    notes: json['Notes']?.toString(),
    phone: json['Phone']?.toString(),
    custType: json['CustType']?.toString(),
    parentCustomer: json['ParentCustomer']?.toString(),
    imagePath: json['ImagePath']?.toString(),
    isInActive: json['IsInActive'] as bool?,
    totalDue: _toDouble(json['TotalDue']),
    lastSalesDate: json['LastSalesDate']?.toString(),
    lastInvoiceNo: json['LastInvoiceNo']?.toString(),
    lastSoldProduct: json['LastSoldProduct']?.toString(),
    totalSalesValue: _toDouble(json['TotalSalesValue']),
    totalSalesReturnValue: _toDouble(json['TotalSalesReturnValue']),
    totalAmountBack: _toDouble(json['TotalAmountBack']),
    totalCollection: _toDouble(json['TotalCollection']),
    lastTransactionDate: json['LastTransactionDate']?.toString(),
    clinetCompanyName: json['ClinetCompanyName']?.toString(),
  );

  static Map<String, dynamic> toJson(CustomerModel c) => {
    'Id': c.id,
    'Name': c.name,
    'Email': c.email,
    'PrimaryAddress': c.primaryAddress,
    'SecoundaryAddress': c.secoundaryAddress,
    'Notes': c.notes,
    'Phone': c.phone,
    'CustType': c.custType,
    'ParentCustomer': c.parentCustomer,
    'ImagePath': c.imagePath,
    'IsInActive': c.isInActive,
    'TotalDue': c.totalDue,
    'LastSalesDate': c.lastSalesDate,
    'LastInvoiceNo': c.lastInvoiceNo,
    'LastSoldProduct': c.lastSoldProduct,
    'TotalSalesValue': c.totalSalesValue,
    'TotalSalesReturnValue': c.totalSalesReturnValue,
    'TotalAmountBack': c.totalAmountBack,
    'TotalCollection': c.totalCollection,
    'LastTransactionDate': c.lastTransactionDate,
    'ClinetCompanyName': c.clinetCompanyName,
  };

  static int? _toInt(dynamic v) =>
      v == null ? null : (v is num ? v.toInt() : int.tryParse(v.toString()));

  static double? _toDouble(dynamic v) =>
      v == null
          ? null
          : (v is num ? v.toDouble() : double.tryParse(v.toString()));
}
