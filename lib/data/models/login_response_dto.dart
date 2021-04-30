import 'package:haggle_x_test/data/models/user.dart';

/// login : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MDg3MjRlMmZiZTRhZTAwMTU1YmMzMGUiLCJpYXQiOjE2MTk0Njk2NzUsImV4cCI6MTYxOTU1NjA3NX0.tS_zVqTgdXc2YELjWFrcchQhysbS6muzOk0mZvRh2zI","twoFactorAuth":null,"user":{"email":"a@a.com","phonenumber":"07089175605","username":"haybee","kycStatus":"UNVERIFIED"}}

class LoginResponseDto {
  Login login;

  LoginResponseDto({
      this.login});

  LoginResponseDto.fromJson(dynamic json) {
    login = json["login"] != null ? Login.fromJson(json["login"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (login != null) {
      map["login"] = login.toJson();
    }
    return map;
  }

}

/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MDg3MjRlMmZiZTRhZTAwMTU1YmMzMGUiLCJpYXQiOjE2MTk0Njk2NzUsImV4cCI6MTYxOTU1NjA3NX0.tS_zVqTgdXc2YELjWFrcchQhysbS6muzOk0mZvRh2zI"
/// twoFactorAuth : null
/// user : {"email":"a@a.com","phonenumber":"07089175605","username":"haybee","kycStatus":"UNVERIFIED"}

class Login {
  String token;
  dynamic twoFactorAuth;
  User user;

  Login({
      this.token, 
      this.twoFactorAuth, 
      this.user});

  Login.fromJson(dynamic json) {
    token = json["token"];
    twoFactorAuth = json["twoFactorAuth"];
    user = json["user"] != null ? User.fromJson(json["user"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["token"] = token;
    map["twoFactorAuth"] = twoFactorAuth;
    if (user != null) {
      map["user"] = user.toJson();
    }
    return map;
  }

}
