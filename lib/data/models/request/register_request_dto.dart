/// email : ""
/// username : ""
/// password : ""
/// phonenumber : ""
/// referralCode : ""
/// country : ""
/// currency : ""
/// phoneNumber : ""
/// callingCode : ""
/// flag : ""

class RegisterRequestDto {
  String email;
  String username;
  String password;
  String phonenumber;
  String referralCode;
  String country;
  String currency;
  String phoneNumber;
  String callingCode;
  String flag;

  RegisterRequestDto({
      this.email, 
      this.username, 
      this.password, 
      this.phonenumber, 
      this.referralCode, 
      this.country, 
      this.currency, 
      this.phoneNumber, 
      this.callingCode, 
      this.flag});

  RegisterRequestDto.fromJson(dynamic json) {
    email = json["email"];
    username = json["username"];
    password = json["password"];
    phonenumber = json["phonenumber"];
    referralCode = json["referralCode"];
    country = json["country"];
    currency = json["currency"];
    phoneNumber = json["phoneNumber"];
    callingCode = json["callingCode"];
    flag = json["flag"];
  }

  Map<String, String> toJson() {
    var map = <String, String>{};
    map["email"] = email;
    map["username"] = username;
    map["password"] = password;
    map["phonenumber"] = phonenumber;
    map["referralCode"] = referralCode;
    map["country"] = country;
    map["currency"] = currency;
    map["phoneNumber"] = phoneNumber;
    map["callingCode"] = callingCode;
    map["flag"] = flag;
    return map;
  }

}