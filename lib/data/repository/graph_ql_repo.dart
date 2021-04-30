import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_x_test/api_response.dart';
import 'package:haggle_x_test/data/models/active_countries_response_dto.dart';
import 'package:haggle_x_test/data/models/login_response_dto.dart';
import 'package:haggle_x_test/data/models/register_response_dto.dart';
import 'package:haggle_x_test/data/models/request/register_request_dto.dart';
import 'package:haggle_x_test/data/models/verify_user_response_dto.dart';
import 'package:haggle_x_test/data/repository/base_client.dart';
import 'package:haggle_x_test/data/repository/local_repository.dart';
import 'package:haggle_x_test/locator.dart';

class GraphQLRepository {
  final String url = 'https://hagglex-backend-staging.herokuapp.com/graphql';

  BaseClient _baseClient = BaseClient();
  LocalRepository _localRepository = locator<LocalRepository>();

  Future<ApiResponse<ActiveCountriesResponseDto>> getActiveCountries() async {
    final WatchQueryOptions _options = WatchQueryOptions(
      document: gql(Queries.getActiveCountries),
      // pollInterval: Duration(seconds: 4),
      fetchResults: true,
    );
    return _baseClient
        .getUnauthorizedClient()
        .query(_options)
        .then((result) async {
      if (result.hasException) {
        return ApiResponse<ActiveCountriesResponseDto>.error(parseError(result.exception.graphqlErrors));
      } else {
        return ApiResponse<ActiveCountriesResponseDto>.completed(
            ActiveCountriesResponseDto.fromJson(result.data));
      }
    }).catchError((err) => ApiResponse<ActiveCountriesResponseDto>.error(err));
  }

  Future<ApiResponse<LoginResponseDto>> login(
      String email, String password) async {
    final MutationOptions _options = MutationOptions(
        document: gql(Queries.login),
        variables: <String, String>{"input": email, "password": password});
    return _baseClient
        .getUnauthorizedClient()
        .mutate(_options)
        .then((result) async {
      if (result.hasException) {
        return ApiResponse<LoginResponseDto>.error(parseError(result.exception.graphqlErrors));
      } else {

        LoginResponseDto loginResponseDto =
            LoginResponseDto.fromJson(result.data);

        _localRepository.saveData('token', loginResponseDto.login.token);

        return ApiResponse<LoginResponseDto>.completed(loginResponseDto);
      }
    }).catchError((err) => ApiResponse<LoginResponseDto>.error(err));
  }



  Future<ApiResponse<RegisterResponseDto>> register(
      RegisterRequestDto registerDto) async {
    final MutationOptions _options = MutationOptions(
      document: gql(Queries.register),
      variables: registerDto.toJson(),
    );
    return _baseClient
        .getUnauthorizedClient()
        .mutate(_options)
        .then((result) async {
      if (result.hasException) {
        return ApiResponse<RegisterResponseDto>.error(parseError(result.exception.graphqlErrors));
      } else {
        RegisterResponseDto registerResponseDto =
            RegisterResponseDto.fromJson(result.data);

        _localRepository.saveData('token', registerResponseDto.register.token);

        return ApiResponse<RegisterResponseDto>.completed(registerResponseDto);
      }
    }).catchError((err) => ApiResponse<RegisterResponseDto>.error(err));
  }

  Future<ApiResponse<VerifyUserResponseDto>> verifyUser(int code) async {
    final MutationOptions _options = MutationOptions(
        document: gql(Queries.verifyUser), variables: {"code": code});

    String token = await _localRepository.getData("token");
    print(token);

    return _baseClient
        .getAuthorizedClient(token)
        .mutate(_options)
        .then((result) async {
      if (result.hasException) {
        return ApiResponse<VerifyUserResponseDto>.error(parseError(result.exception.graphqlErrors));
      } else {
        VerifyUserResponseDto verifyUserResponseDto =
            VerifyUserResponseDto.fromJson(result.data);

        _localRepository.saveData('token', verifyUserResponseDto.verifyUser.token);

        return ApiResponse<VerifyUserResponseDto>.completed(
            verifyUserResponseDto);
      }
    }).catchError((err) => ApiResponse<VerifyUserResponseDto>.error(err));
  }

  Future<ApiResponse<bool>> resendVerificationCode(String email) async {
    final MutationOptions _options = MutationOptions(
        document: gql(Queries.resendVerificationCode),
        variables: {"email": email});
    return _baseClient
        .getUnauthorizedClient()
        .mutate(_options)
        .then((result) async {
      if (result.hasException) {
        return ApiResponse<bool>.error(parseError(result.exception.graphqlErrors));
      } else {
        return ApiResponse<bool>.completed(
            result.data["resendVerificationCode"]);
      }
    }).catchError((err) => ApiResponse<bool>.error(err));
  }

  String parseError(List<GraphQLError> errors){
    return errors.map((e) => e.message).toList().join("\n");
  }
}


class Queries {
  static String get getActiveCountries => """
      {
        getActiveCountries {
          name
          callingCode
          flag
          alpha2Code
          alpha3Code
          currencyCode
          currencyDetails{
            code
            name
            symbol
          }
        }
      }
  """;

  static String get login => """
      mutation (\$input: String!, \$password: String!){
        login(data: {
          input: \$input,
          password: \$password,
        }) {
          token
          twoFactorAuth
          user{
            _id
            email
            phonenumber
            phoneNumberDetails{
              phoneNumber
              callingCode
              flag
            }
            referralCode
            username
            kycStatus
            createdAt
          }
        }
      } 
    """;

  static String get register => """

    mutation (\$email: String!,
      \$username: String!,
       \$password: String!,
       \$phonenumber: String!,
       \$referralCode: String,
       \$country: String!,
       \$currency: String!,
       \$phoneNumber: String!,
      \$callingCode: String!,
      \$flag: String!,
    ){
      register(data: {
        email: \$email,
        username: \$username,
        password: \$password,
        phonenumber: \$phonenumber,
        referralCode: \$referralCode,
        country: \$country,
        currency: \$currency,
        phoneNumberDetails: {
          phoneNumber: \$phoneNumber,
          callingCode: \$callingCode,
          flag: \$flag
        }
        
      }) {
        token
        user{
          _id
          email
          phonenumber
          phoneNumberDetails{
            phoneNumber
            callingCode
            flag
          }
          referralCode
          username
          kycStatus
          createdAt
        }
      }
    }  
  """;

  static String get verifyUser => """
      mutation (\$code: Int!){
      verifyUser(data: {
        code: \$code
      }) {
        token
        user{
          _id
          email
          phonenumber
          phoneNumberDetails{
            phoneNumber
            callingCode
            flag
          }
          referralCode
          username
          kycStatus
          createdAt
        }
      }
    }
  """;

  static String get resendVerificationCode => """
      query ResendCode (\$email: String!){
     resendVerificationCode (data: {
      email: \$email
    })
    }
  """;
}
