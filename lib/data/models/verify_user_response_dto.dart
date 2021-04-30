import 'package:haggle_x_test/data/models/user.dart';

/// verifyUser : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MDg3MmZlYWZiZTRhZTAwMTU1YmMzMTEiLCJpYXQiOjE2MTk0NzI1MTEsImV4cCI6MTYxOTU1ODkxMX0.-ekVZ88ssLsS2UvzDsdIYbvasXjIzx1WW7cQnHxZ23Y","user":{"_id":"60872feafbe4ae00155bc311","email":"jesse.carper@wifimaple.com","phonenumber":"07089175609","phoneNumberDetails":{"phoneNumber":"07089175600","callingCode":"234","flag":"https://restcountries.eu/data/nga.svg"},"referralCode":"dj75XIlCj","username":"hayboy","kycStatus":"UNVERIFIED","createdAt":"1619472362132"}}

class VerifyUserResponseDto {
  VerifyUser verifyUser;

  VerifyUserResponseDto({
      this.verifyUser});

  VerifyUserResponseDto.fromJson(dynamic json) {
    verifyUser = json["verifyUser"] != null ? VerifyUser.fromJson(json["verifyUser"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (verifyUser != null) {
      map["verifyUser"] = verifyUser.toJson();
    }
    return map;
  }

}

/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MDg3MmZlYWZiZTRhZTAwMTU1YmMzMTEiLCJpYXQiOjE2MTk0NzI1MTEsImV4cCI6MTYxOTU1ODkxMX0.-ekVZ88ssLsS2UvzDsdIYbvasXjIzx1WW7cQnHxZ23Y"
/// user : {"_id":"60872feafbe4ae00155bc311","email":"jesse.carper@wifimaple.com","phonenumber":"07089175609","phoneNumberDetails":{"phoneNumber":"07089175600","callingCode":"234","flag":"https://restcountries.eu/data/nga.svg"},"referralCode":"dj75XIlCj","username":"hayboy","kycStatus":"UNVERIFIED","createdAt":"1619472362132"}

class VerifyUser {
  String token;
  User user;

  VerifyUser({
      this.token, 
      this.user});

  VerifyUser.fromJson(dynamic json) {
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
