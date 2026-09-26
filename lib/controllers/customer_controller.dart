import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/api_constants.dart';
import 'package:flutter_getx_project_template/controllers/customer_data_handler.dart';
import 'package:flutter_getx_project_template/models/customer_model.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final RxList<CustomerModel> customers = <CustomerModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isPaginating = false.obs;
  final RxBool hasMoreData = true.obs;
  final RxBool hasPaginationError = false.obs;

  final RxString errorMessage = ''.obs;
  final RxString paginationErrorMessage = ''.obs;
  final RxString searchQuery = ''.obs;

  int currentPage = 1;
  final int pageSize = ApiConstants.defaultPageSize;
  int pageCount = 0;
  final RxInt totalRecordCount = 0.obs;
  Timer? _debounceTimer;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() => CustomerDataHandler.onScroll(this));
    fetchInitialCustomers();
  }

  void onSearchChanged(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 400), () {
      final trimmed = query.trim();
      if (searchQuery.value != trimmed) {
        searchQuery.value = trimmed;
        fetchInitialCustomers();
      }
    });
  }

  void clearSearch() {
    searchController.clear();
    _debounceTimer?.cancel();
    if (searchQuery.value.isNotEmpty) {
      searchQuery.value = '';
      fetchInitialCustomers();
    }
  }

  Future<void> fetchInitialCustomers() => CustomerDataHandler.fetchInitial(this);

  Future<void> loadNextPage() => CustomerDataHandler.loadNextPage(this);

  void retryPagination() {
    hasPaginationError.value = false;
    loadNextPage();
  }

  Future<void> refreshCustomers() => fetchInitialCustomers();

  @override
  void onClose() {
    _debounceTimer?.cancel();
    searchController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
