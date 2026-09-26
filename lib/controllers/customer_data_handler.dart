import 'package:flutter_getx_project_template/controllers/customer_controller.dart';
import 'package:flutter_getx_project_template/services/api/api_exception.dart';
import 'package:flutter_getx_project_template/services/api/api_service.dart';
import 'package:get/get.dart';

class CustomerDataHandler {
  static void onScroll(CustomerController c) {
    if (c.scrollController.hasClients &&
        c.scrollController.position.pixels >=
            c.scrollController.position.maxScrollExtent - 200) {
      if (!c.isLoading.value &&
          !c.isPaginating.value &&
          c.hasMoreData.value &&
          !c.hasPaginationError.value) {
        loadNextPage(c);
      }
    }
  }

  static Future<void> fetchInitial(CustomerController c) async {
    c.isLoading.value = true;
    c.errorMessage.value = '';
    c.hasPaginationError.value = false;
    c.currentPage = 1;
    c.hasMoreData.value = true;
    try {
      final res = await ApiService.instance.getCustomerList(
        searchQuery: c.searchQuery.value,
        pageNo: 1,
        pageSize: c.pageSize,
      );
      c.customers.assignAll(res.customerList);
      c.currentPage = res.pageInfo.pageNo;
      c.pageCount = res.pageInfo.pageCount;
      c.totalRecordCount.value = res.pageInfo.totalRecordCount;
      c.hasMoreData.value =
          (c.currentPage < c.pageCount) && (c.customers.length < c.totalRecordCount.value);
    } on ApiException catch (e) {
      c.errorMessage.value = e.message;
    } catch (_) {
      c.errorMessage.value = 'Unable to load customers. Please try again.';
    } finally {
      c.isLoading.value = false;
    }
  }

  static Future<void> loadNextPage(CustomerController c) async {
    if (c.isPaginating.value || !c.hasMoreData.value || c.hasPaginationError.value) {
      return;
    }
    c.isPaginating.value = true;
    c.hasPaginationError.value = false;
    try {
      final res = await ApiService.instance.getCustomerList(
        searchQuery: c.searchQuery.value,
        pageNo: c.currentPage + 1,
        pageSize: c.pageSize,
      );
      if (res.customerList.isEmpty) {
        c.hasMoreData.value = false;
      } else {
        c.customers.addAll(res.customerList);
        c.currentPage = res.pageInfo.pageNo;
        c.pageCount = res.pageInfo.pageCount;
        c.totalRecordCount.value = res.pageInfo.totalRecordCount;
        c.hasMoreData.value =
            (c.currentPage < c.pageCount) && (c.customers.length < c.totalRecordCount.value);
      }
    } on ApiException catch (e) {
      c.hasPaginationError.value = true;
      c.paginationErrorMessage.value = e.message;
    } catch (_) {
      c.hasPaginationError.value = true;
      c.paginationErrorMessage.value = 'Failed to load more. Tap to retry.';
    } finally {
      c.isPaginating.value = false;
    }
  }
}
