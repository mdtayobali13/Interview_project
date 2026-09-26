import 'package:flutter_getx_project_template/constant/app_storage_key.dart';
import 'package:flutter_getx_project_template/utils/error_log.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageServices {
  GetStorageServices._();
  static final GetStorageServices _instance = GetStorageServices._();
  static GetStorageServices get instance => _instance;

  final GetStorage box = GetStorage();

  Future<void> setToken(String value) async {
    try {
      await box.write(AppStorageKey.instance.token, value);
      await box.save();
    } catch (e) {
      errorLog("set token", e);
    }
  }

  String getToken() {
    try {
      return box.read(AppStorageKey.instance.token) ?? "";
    } catch (_) {
      return "";
    }
  }

  bool isLoggedIn() => getToken().trim().isNotEmpty;

  Future<void> saveUserSession({
    required String token,
    String? userName,
    String? email,
  }) async {
    try {
      await box.write(AppStorageKey.instance.token, token);
      if (userName != null) {
        await box.write(AppStorageKey.instance.userData, userName);
      }
      if (email != null) {
        await box.write(AppStorageKey.instance.userRole, email);
      }
      await box.save();
    } catch (e) {
      errorLog("saveUserSession", e);
    }
  }

  String getUserName() => box.read(AppStorageKey.instance.userData) ?? "User";

  Future<void> setOnboardScreen() async =>
      box.write(AppStorageKey.instance.onboard, true);

  bool getOnboardScreen() => box.read(AppStorageKey.instance.onboard) ?? false;

  Future<void> setUserRole(String value) async =>
      box.write(AppStorageKey.instance.userRole, value);

  String? getUserRole() => box.read(AppStorageKey.instance.userRole);

  String? getLanguage() => box.read(AppStorageKey.instance.language);

  Future<void> setLanguage(String value) async =>
      box.write(AppStorageKey.instance.language, value);

  String getCountry() => box.read(AppStorageKey.instance.country) ?? "";

  Future<void> setCountry(String value) async =>
      box.write(AppStorageKey.instance.country, value);

  Future<void> storageClear() async {
    try {
      await box.remove(AppStorageKey.instance.token);
      await box.remove(AppStorageKey.instance.userData);
      await box.remove(AppStorageKey.instance.userRole);
      await box.save();
    } catch (e) {
      errorLog("storageClear", e);
    }
  }
}
