import 'package:flutter_getx_project_template/constant/api_constants.dart';
import 'package:flutter_getx_project_template/models/customer_list_response.dart';
import 'package:flutter_getx_project_template/models/customer_model.dart';
import 'package:flutter_getx_project_template/models/login_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('LoginResponseModel parses json', () {
    final model = LoginResponseModel.fromJson({
      'UserName': 'admin',
      'Token': 'test_token',
      'UserId': 130,
      'Email': 'admin@gmail.com',
    });
    expect(model.userName, 'admin');
    expect(model.token, 'test_token');
    expect(model.userId, 130);
  });

  test('CustomerModel parses and formats', () {
    final model = CustomerModel.fromJson({
      'Id': 39,
      'Name': 'Four H Apparels',
      'Phone': '01671303302',
      'CustType': 'G',
      'TotalDue': 1200.5,
      'ImagePath': '/Content/39.png',
    });
    expect(model.id, 39);
    expect(model.customerTypeDisplay, 'General');
    expect(model.formattedBalance, '৳1200.50');
    expect(model.fullImageUrl, 'https://www.Hisabplus.com/Content/39.png');
  });

  test('CustomerListResponse parses page info', () {
    final res = CustomerListResponse.fromJson({
      'Success': 1,
      'CustomerList': [
        {'Id': 1, 'Name': 'Customer A'},
      ],
      'PageInfo': {'PageNo': 1, 'TotalRecordCount': 100, 'PageCount': 5},
    });
    expect(res.customerList.length, 1);
    expect(res.pageInfo.pageNo, 1);
    expect(res.pageInfo.totalRecordCount, 100);
  });

  test('ApiConstants generates image URL', () {
    expect(
      ApiConstants.getFullImageUrl('/img.png'),
      'https://www.Hisabplus.com/img.png',
    );
    expect(ApiConstants.getFullImageUrl(null), '');
  });
}
