class AuthResponse {
  AuthResponse({
    required this.token,
    required this.name,
  });
  late final String token;
  late final String name;
  
  AuthResponse.fromJson(Map<String, dynamic> json){
    token = json['token'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    data['name'] = name;
    return data;
  }
}