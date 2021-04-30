import 'package:flutter/material.dart';
import 'package:haggle_x_test/api_response.dart';
import 'package:haggle_x_test/data/models/active_countries_response_dto.dart';
import 'package:haggle_x_test/data/repository/graph_ql_repo.dart';
import 'package:haggle_x_test/locator.dart';

class CountryProvider extends ChangeNotifier {
  GraphQLRepository _repository = locator<GraphQLRepository>();
  ApiResponse<ActiveCountriesResponseDto> countriesResponse
  = ApiResponse<ActiveCountriesResponseDto>.loading();
  List<Country> countries = new List();

  Future<void> getActiveCountries()async {
    countriesResponse = ApiResponse<ActiveCountriesResponseDto>.loading();
    notifyListeners();


    countriesResponse = await _repository.getActiveCountries();
    if(countriesResponse.status == Status.COMPLETED){
      countries = countriesResponse.data.activeCountries;
    }
    notifyListeners();
  }

  void filterCountries(String searchWord){
    if(searchWord.isNotEmpty) {
      countries = countriesResponse.data.activeCountries
          .where((country) =>
          country.name.toLowerCase().contains(searchWord.toLowerCase()))
          .toList();

    }else{
      resetCountryList();
    }
    notifyListeners();
  }

  void resetCountryList(){
    countries = countriesResponse.data.activeCountries;
    // notifyListeners();
  }
}