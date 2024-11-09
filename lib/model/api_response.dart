class ApiResponse {
  ApiResponse({
    this.status,
    this.message,
    this.totalData,
    this.totalPage,
    this.page,
    this.size,
    this.data,
  });

  String? status;
  String? message;
  dynamic totalData;
  dynamic totalPage;
  dynamic page;
  dynamic size;
  dynamic data;

  // For General Use Without Data
  static Map<String, dynamic> success(String status, String message) {
    return <String, dynamic>{
      'status': status,
      'message': message,
    };
  }

  // For General Use Without Data
  static Map<String, dynamic> successWithData(
    String status,
    String message,
    dynamic data,
  ) {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data,
    };
  }

  // For Get Single Data
  static Map<String, dynamic> successGetSingle(
      String status, String message, dynamic data) {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data,
    };
  }

  // For Get List of Data
  static Map<String, dynamic> successGetList(
    String status,
    String message,
    dynamic data,
    dynamic totalData,
    dynamic totalPage,
    dynamic size,
    dynamic page,
  ) {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data,
      'totalData': totalData,
      'totalPage': totalPage,
      'size': size,
      'page': page,
    };
  }

  // For Delete
  static Map<String, dynamic> successDelete(String status, String message) {
    return <String, dynamic>{
      'status': status,
      'message': message,
    };
  }

  static Map<String, dynamic> failed(String status, String message) {
    return <String, dynamic>{
      'status': status,
      'message': message,
    };
  }
}
