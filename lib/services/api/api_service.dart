import 'package:dio/dio.dart';
import 'package:flutter_getx_project_template/constant/api_constants.dart';
import 'package:flutter_getx_project_template/models/customer_list_response.dart';
import 'package:flutter_getx_project_template/models/login_response_model.dart';
import 'package:flutter_getx_project_template/services/api/api_exception.dart';
import 'package:flutter_getx_project_template/services/storage_services/get_storage_services.dart';

class ApiService {
  late final Dio _dio;

  ApiService._() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: {'Accept': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = GetStorageServices.instance.getToken();
          if (token.isNotEmpty) {
            options.headers['Authorization'] = token;
          }
          return handler.next(options);
        },
      ),
    );
  }

  static final ApiService _instance = ApiService._();
  static ApiService get instance => _instance;
  Dio get client => _dio;

  Future<LoginResponseModel> login({
    required String userName,
    required String password,
    int comId = ApiConstants.defaultComId,
  }) async {
    try {
      final res = await _dio.get(
        ApiConstants.loginEndpoint,
        queryParameters: {
          'UserName': userName.trim(),
          'Password': password.trim(),
          'ComId': comId,
        },
      );
      if (res.statusCode == 200 && res.data is Map<String, dynamic>) {
        final model = LoginResponseModel.fromJson(res.data);
        if (model.token != null && model.token!.isNotEmpty) {
          await GetStorageServices.instance.saveUserSession(
            token: model.token!,
            userName: model.userName ?? userName,
            email: model.email ?? userName,
          );
        }
        return model;
      }
      throw ApiException('Invalid username or password.');
    } on DioException catch (e) {
      throw ApiException.fromDio(e, isLogin: true);
    }
  }

  Future<CustomerListResponse> getCustomerList({
    String searchQuery = '',
    int pageNo = 1,
    int pageSize = ApiConstants.defaultPageSize,
    String sortBy = ApiConstants.defaultSortBy,
  }) async {
    try {
      final res = await _dio.get(
        ApiConstants.customerListEndpoint,
        queryParameters: {
          'searchquery': searchQuery.trim(),
          'pageNo': pageNo,
          'pageSize': pageSize,
          'sortBy': sortBy,
        },
      );
      if (res.statusCode == 200 && res.data is Map<String, dynamic>) {
        return CustomerListResponse.fromJson(res.data);
      }
      throw ApiException('Unable to load customers. Please try again.');
    } on DioException catch (e) {
      throw ApiException.fromDio(e, isLogin: false);
    }
  }
}
