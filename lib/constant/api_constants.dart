class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://www.hisabplus.com/Values/';
  static const String imageBaseUrl = 'https://www.Hisabplus.com/';

  static const String loginEndpoint = 'Login';
  static const String customerListEndpoint = 'GetCustomerList';

  static const int defaultComId = 1;
  static const int defaultPageSize = 20;
  static const String defaultSortBy = 'Balance';

  static String getFullImageUrl(String? relativePath) {
    if (relativePath == null || relativePath.trim().isEmpty) return '';
    final trimmed = relativePath.trim();
    if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
      return trimmed;
    }
    final cleanPath = trimmed.startsWith('/') ? trimmed.substring(1) : trimmed;
    return '$imageBaseUrl$cleanPath';
  }
}
