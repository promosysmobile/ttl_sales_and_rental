class LoginResponse {
  final Data data;
  final Map<String, dynamic> meta;
  final String message;
  final int statusCode;

  LoginResponse({
    required this.data,
    required this.meta,
    required this.message,
    required this.statusCode,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      data: Data.fromJson(json['data']),
      meta: json['meta'] ?? {},
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'meta': meta,
      'message': message,
      'statusCode': statusCode,
    };
  }
}

class Data {
  final String accessToken;
  final User user;

  Data({
    required this.accessToken,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      accessToken: json['access_token'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'user': user.toJson(),
    };
  }
}

class User {
  final String uuid;
  final String name;
  final String email;
  final String userType;

  User({
    required this.uuid,
    required this.name,
    required this.email,
    required this.userType,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uuid: json['uuid'],
      name: json['name'],
      email: json['email'],
      userType: json['userType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'name': name,
      'email': email,
      'userType': userType,
    };
  }
}
