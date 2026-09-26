class LoginResponseModel {
  final String? userName;
  final String? token;
  final int? userId;
  final int? comId;
  final String? email;
  final String? companyName;
  final String? roleName;
  final String? weightScaleBarcodeStartWith;
  final String? empImagePath;
  final bool? isSerialSales;
  final int? decimalField;
  final String? businessTypeName;
  final int? defaultCurrencyId;
  final String? currencySymbol;
  final String? currencyShortName;
  final bool? isVatLogin;

  LoginResponseModel({
    this.userName,
    this.token,
    this.userId,
    this.comId,
    this.email,
    this.companyName,
    this.roleName,
    this.weightScaleBarcodeStartWith,
    this.empImagePath,
    this.isSerialSales,
    this.decimalField,
    this.businessTypeName,
    this.defaultCurrencyId,
    this.currencySymbol,
    this.currencyShortName,
    this.isVatLogin,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      userName: json['UserName']?.toString(),
      token: json['Token']?.toString(),
      userId: _toInt(json['UserId']),
      comId: _toInt(json['ComId']),
      email: json['Email']?.toString(),
      companyName: json['CompanyName']?.toString(),
      roleName: json['RoleName']?.toString(),
      weightScaleBarcodeStartWith:
          json['WeightScaleBarcodeStartWith']?.toString(),
      empImagePath: json['EmpImagePath']?.toString(),
      isSerialSales: json['IsSerialSales'] as bool?,
      decimalField: _toInt(json['DecimalField']),
      businessTypeName: json['BusinessTypeName']?.toString(),
      defaultCurrencyId: _toInt(json['DefaultCurrencyId']),
      currencySymbol: json['CurrencySymbol']?.toString(),
      currencyShortName: json['CurrencyShortName']?.toString(),
      isVatLogin: json['IsVatLogin'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'UserName': userName,
      'Token': token,
      'UserId': userId,
      'ComId': comId,
      'Email': email,
      'CompanyName': companyName,
      'RoleName': roleName,
      'WeightScaleBarcodeStartWith': weightScaleBarcodeStartWith,
      'EmpImagePath': empImagePath,
      'IsSerialSales': isSerialSales,
      'DecimalField': decimalField,
      'BusinessTypeName': businessTypeName,
      'DefaultCurrencyId': defaultCurrencyId,
      'CurrencySymbol': currencySymbol,
      'CurrencyShortName': currencyShortName,
      'IsVatLogin': isVatLogin,
    };
  }

  static int? _toInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString());
  }
}
