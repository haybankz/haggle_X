/// _id : "608724e2fbe4ae00155bc30e"
/// email : "a@a.com"
/// phonenumber : "07089175605"
/// phoneNumberDetails : {"phoneNumber":"07089175605","callingCode":"234","flag":"https://restcountries.eu/data/nga.svg"}
/// referralCode : "b7MT7ypjl"
/// username : "haybee"
/// kycStatus : "UNVERIFIED"
/// createdAt : "1619469538025"

class User {
  String id;
  String email;
  String phonenumber;
  PhoneNumberDetails phoneNumberDetails;
  String referralCode;
  String username;
  String kycStatus;
  String createdAt;

  User({
      this.id, 
      this.email, 
      this.phonenumber, 
      this.phoneNumberDetails, 
      this.referralCode, 
      this.username, 
      this.kycStatus, 
      this.createdAt});

  User.fromJson(dynamic json) {
    id = json["_id"];
    email = json["email"];
    phonenumber = json["phonenumber"];
    phoneNumberDetails = json["phoneNumberDetails"] != null ? PhoneNumberDetails.fromJson(json["phoneNumberDetails"]) : null;
    referralCode = json["referralCode"];
    username = json["username"];
    kycStatus = json["kycStatus"];
    createdAt = json["createdAt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["_id"] = id;
    map["email"] = email;
    map["phonenumber"] = phonenumber;
    if (phoneNumberDetails != null) {
      map["phoneNumberDetails"] = phoneNumberDetails.toJson();
    }
    map["referralCode"] = referralCode;
    map["username"] = username;
    map["kycStatus"] = kycStatus;
    map["createdAt"] = createdAt;
    return map;
  }

}

/// phoneNumber : "07089175605"
/// callingCode : "234"
/// flag : "https://restcountries.eu/data/nga.svg"

class PhoneNumberDetails {
  String phoneNumber;
  String callingCode;
  String flag;

  PhoneNumberDetails({
      this.phoneNumber, 
      this.callingCode, 
      this.flag});

  PhoneNumberDetails.fromJson(dynamic json) {
    phoneNumber = json["phoneNumber"];
    callingCode = json["callingCode"];
    flag = json["flag"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["phoneNumber"] = phoneNumber;
    map["callingCode"] = callingCode;
    map["flag"] = flag;
    return map;
  }

}