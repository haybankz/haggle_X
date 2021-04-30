import 'package:haggle_x_test/data/models/user.dart';

/// register : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MDg3MjRmZWZiZTRhZTAwMTU1YmMzMGYiLCJpYXQiOjE2MTk0Njk1NjYsImV4cCI6MTYxOTU1NTk2Nn0.76xrJ6hR64qqMmwlW59ZxaLtmpIZdUi2urlSYI0TehI","user":{"email":"a@a3.com","phonenumber":"070891756053","username":"haybee1","kycStatus":"UNVERIFIED"}}

class RegisterResponseDto {
  Register register;

  RegisterResponseDto({
      this.register});

  RegisterResponseDto.fromJson(dynamic json) {
    register = json["register"] != null ? Register.fromJson(json["register"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (register != null) {
      map["register"] = register.toJson();
    }
    return map;
  }

}

/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MDg3MjRmZWZiZTRhZTAwMTU1YmMzMGYiLCJpYXQiOjE2MTk0Njk1NjYsImV4cCI6MTYxOTU1NTk2Nn0.76xrJ6hR64qqMmwlW59ZxaLtmpIZdUi2urlSYI0TehI"
/// user : {"email":"a@a3.com","phonenumber":"070891756053","username":"haybee1","kycStatus":"UNVERIFIED"}

class Register {
  String token;
  User user;

  Register({
      this.token, 
      this.user});

  Register.fromJson(dynamic json) {
    token = json["token"];
    user = json["user"] != null ? User.fromJson(json["user"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["token"] = token;
    if (user != null) {
      map["user"] = user.toJson();
    }
    return map;
  }

}
