class PageInfoModel {
  final int pageNo;
  final int pageSize;
  final int pageCount;
  final int totalRecordCount;

  PageInfoModel({
    this.pageNo = 1,
    this.pageSize = 20,
    this.pageCount = 0,
    this.totalRecordCount = 0,
  });

  factory PageInfoModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return PageInfoModel();
    }
    return PageInfoModel(
      pageNo: _toInt(json['PageNo']) ?? 1,
      pageSize: _toInt(json['PageSize']) ?? 20,
      pageCount: _toInt(json['PageCount']) ?? 0,
      totalRecordCount: _toInt(json['TotalRecordCount']) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'PageNo': pageNo,
      'PageSize': pageSize,
      'PageCount': pageCount,
      'TotalRecordCount': totalRecordCount,
    };
  }

  static int? _toInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString());
  }
}
