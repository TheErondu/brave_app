class UserModel {
  User? user;
  String? message;
  String? department;

  UserModel({this.user, this.message, this.department});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    message = json['message'];
    department = json['department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['message'] = message;
    data['department'] = department;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  int? departmentId;
  String? role;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  int? ticketitAdmin;
  int? ticketitAgent;
  String? status;
  Department? department;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.departmentId,
      this.role,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.ticketitAdmin,
      this.ticketitAgent,
      this.status,
      this.department});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    departmentId = json['department_id'];
    role = json['role'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ticketitAdmin = json['ticketit_admin'];
    ticketitAgent = json['ticketit_agent'];
    status = json['status'];
    department = json['department'] != null
        ? Department.fromJson(json['department'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['department_id'] = departmentId;
    data['role'] = role;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['ticketit_admin'] = ticketitAdmin;
    data['ticketit_agent'] = ticketitAgent;
    data['status'] = status;
    if (department != null) {
      data['department'] = department!.toJson();
    }
    return data;
  }
}

class Department {
  int? id;
  String? name;
  String? mailGroup;
  int? userId;
  String? color;
  String? createdAt;
  String? updatedAt;

  Department(
      {this.id,
      this.name,
      this.mailGroup,
      this.userId,
      this.color,
      this.createdAt,
      this.updatedAt});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mailGroup = json['mail_group'];
    userId = json['user_id'];
    color = json['color'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mail_group'] = mailGroup;
    data['user_id'] = userId;
    data['color'] = color;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
