class GenericResponse {
  GenericResponse({
    required this.success,
    required this.message,
    required this.data,
    required this.errors,
  });
  late  bool success =false;
  late  dynamic message ="";
  late  dynamic data =[];
  late  dynamic errors=[];

  GenericResponse.fromJson(Map<String, dynamic> json) {
    success = json['success']??success;
    message = json['message']??message;
    data = json['data']??data;
    errors = json['errors']??errors;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['data'] = data;
    data['errors'] = errors;
    return data;
  }
}
