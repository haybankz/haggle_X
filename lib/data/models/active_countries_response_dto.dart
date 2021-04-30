/// getActiveCountries : [{"name":"Australia","callingCode":"61","flag":"https://restcountries.eu/data/aus.svg","alpha2Code":"AU","alpha3Code":"AUS","currencyCode":"AUD","currencyDetails":{"code":"AUD","name":"Australian dollar","symbol":"$"}},{"name":"Austria","callingCode":"43","flag":"https://restcountries.eu/data/aut.svg","alpha2Code":"AT","alpha3Code":"AUT","currencyCode":"EUR","currencyDetails":{"code":"EUR","name":"Euro","symbol":"€"}},{"name":"Botswana","callingCode":"267","flag":"https://restcountries.eu/data/bwa.svg","alpha2Code":"BW","alpha3Code":"BWA","currencyCode":"BWP","currencyDetails":{"code":"BWP","name":"Botswana pula","symbol":"P"}},{"name":"Cyprus","callingCode":"357","flag":"https://restcountries.eu/data/cyp.svg","alpha2Code":"CY","alpha3Code":"CYP","currencyCode":"EUR","currencyDetails":{"code":"EUR","name":"Euro","symbol":"€"}},{"name":"Gambia","callingCode":"220","flag":"https://restcountries.eu/data/gmb.svg","alpha2Code":"GM","alpha3Code":"GMB","currencyCode":"GMD","currencyDetails":{"code":"GMD","name":"Gambian dalasi","symbol":"D"}},{"name":"Kenya","callingCode":"254","flag":"https://restcountries.eu/data/ken.svg","alpha2Code":"KE","alpha3Code":"KEN","currencyCode":"KES","currencyDetails":{"code":"KES","name":"Kenyan shilling","symbol":"Sh"}},{"name":"Malawi","callingCode":"265","flag":"https://restcountries.eu/data/mwi.svg","alpha2Code":"MW","alpha3Code":"MWI","currencyCode":"MWK","currencyDetails":{"code":"MWK","name":"Malawian kwacha","symbol":"MK"}},{"name":"Nigeria","callingCode":"234","flag":"https://restcountries.eu/data/nga.svg","alpha2Code":"NG","alpha3Code":"NGA","currencyCode":"NGN","currencyDetails":{"code":"NGN","name":"Nigerian naira","symbol":"₦"}},{"name":"Philippines","callingCode":"63","flag":"https://restcountries.eu/data/phl.svg","alpha2Code":"PH","alpha3Code":"PHL","currencyCode":"PHP","currencyDetails":{"code":"PHP","name":"Philippine peso","symbol":"₱"}},{"name":"South Africa","callingCode":"27","flag":"https://restcountries.eu/data/zaf.svg","alpha2Code":"ZA","alpha3Code":"ZAF","currencyCode":"ZAR","currencyDetails":{"code":"ZAR","name":"South African rand","symbol":"R"}},{"name":"Tanzania, United Republic of","callingCode":"255","flag":"https://restcountries.eu/data/tza.svg","alpha2Code":"TZ","alpha3Code":"TZA","currencyCode":"TZS","currencyDetails":{"code":"TZS","name":"Tanzanian shilling","symbol":"Sh"}},{"name":"Turkey","callingCode":"90","flag":"https://restcountries.eu/data/tur.svg","alpha2Code":"TR","alpha3Code":"TUR","currencyCode":"TRY","currencyDetails":{"code":"TRY","name":"Turkish lira","symbol":null}},{"name":"Uganda","callingCode":"256","flag":"https://restcountries.eu/data/uga.svg","alpha2Code":"UG","alpha3Code":"UGA","currencyCode":"UGX","currencyDetails":{"code":"UGX","name":"Ugandan shilling","symbol":"Sh"}},{"name":"United Arab Emirates","callingCode":"971","flag":"https://restcountries.eu/data/are.svg","alpha2Code":"AE","alpha3Code":"ARE","currencyCode":"AED","currencyDetails":{"code":"AED","name":"United Arab Emirates dirham","symbol":"د.إ"}},{"name":"Zimbabwe","callingCode":"263","flag":"https://restcountries.eu/data/zwe.svg","alpha2Code":"ZW","alpha3Code":"ZWE","currencyCode":"BWP","currencyDetails":{"code":"BWP","name":"Botswana pula","symbol":"P"}}]

class ActiveCountriesResponseDto {
  List<Country> activeCountries;

  ActiveCountriesResponseDto({
      this.activeCountries});

  ActiveCountriesResponseDto.fromJson(dynamic json) {
    if (json["getActiveCountries"] != null) {
      activeCountries = [];
      json["getActiveCountries"].forEach((v) {
        activeCountries.add(Country.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (activeCountries != null) {
      map["getActiveCountries"] = activeCountries.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "Australia"
/// callingCode : "61"
/// flag : "https://restcountries.eu/data/aus.svg"
/// alpha2Code : "AU"
/// alpha3Code : "AUS"
/// currencyCode : "AUD"
/// currencyDetails : {"code":"AUD","name":"Australian dollar","symbol":"$"}

class Country {
  String name;
  String callingCode;
  String flag;
  String alpha2Code;
  String alpha3Code;
  String currencyCode;
  CurrencyDetails currencyDetails;

  Country({
      this.name, 
      this.callingCode, 
      this.flag, 
      this.alpha2Code, 
      this.alpha3Code, 
      this.currencyCode, 
      this.currencyDetails});

  Country.fromJson(dynamic json) {
    name = json["name"];
    callingCode = json["callingCode"];
    flag = json["flag"];
    alpha2Code = json["alpha2Code"];
    alpha3Code = json["alpha3Code"];
    currencyCode = json["currencyCode"];
    currencyDetails = json["currencyDetails"] != null ? CurrencyDetails.fromJson(json["currencyDetails"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["callingCode"] = callingCode;
    map["flag"] = flag;
    map["alpha2Code"] = alpha2Code;
    map["alpha3Code"] = alpha3Code;
    map["currencyCode"] = currencyCode;
    if (currencyDetails != null) {
      map["currencyDetails"] = currencyDetails.toJson();
    }
    return map;
  }

}

/// code : "AUD"
/// name : "Australian dollar"
/// symbol : "$"

class CurrencyDetails {
  String code;
  String name;
  String symbol;

  CurrencyDetails({
      this.code, 
      this.name, 
      this.symbol});

  CurrencyDetails.fromJson(dynamic json) {
    code = json["code"];
    name = json["name"];
    symbol = json["symbol"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = code;
    map["name"] = name;
    map["symbol"] = symbol;
    return map;
  }

}