import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:haggle_x_test/api_response.dart';
import 'package:haggle_x_test/data/models/active_countries_response_dto.dart';
import 'package:haggle_x_test/providers/country_provider.dart';
import 'package:haggle_x_test/utils/dimension.dart';
import 'package:haggle_x_test/utils/routes.dart';
import 'package:haggle_x_test/utils/theme.dart';
import 'package:provider/provider.dart';

class CountryCodeWidget extends StatefulWidget {
  final Function(Country) onSelect;

  CountryCodeWidget({@required this.onSelect}) : assert( onSelect != null);

  @override
  _CountryCodeState createState() => _CountryCodeState();
}

class _CountryCodeState extends State<CountryCodeWidget> {
  CountryProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      provider.getActiveCountries();
    });
  }

  Country country = Country(
      name: "Nigeria",
      alpha2Code: "NG",
      alpha3Code: "NGA",
      callingCode: "234",
      flag: "https://restcountries.eu/data/nga.svg");
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<CountryProvider>(context);

    return GestureDetector(
      onTap: () async {
        if (provider.countriesResponse.status != Status.LOADING) {
          var result = await Get.toNamed(Routes.activeCountry);
          if (result != null) {
            widget.onSelect(result);
            setState(() {
              country = result;

            });
          }
        }
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: black, width: 0.5)),
        child: provider.countriesResponse.status != Status.LOADING
            ? _buildCCode()
            : Icon(Icons.refresh),
      ),
    );
  }

  Row _buildCCode() {
    return Row(
      children: [
        SvgPicture.network(
          country.flag,
          placeholderBuilder: (_) => Image.asset('assets/images/app_logo.png',
            height: 12,
            width: 14,
            fit: BoxFit.fill,),
          height: 12,
          width: 14,
          fit: BoxFit.fill,
        ),
        XMargin(6),
        Text(
          '(${country.callingCode})',
          style: textStyle.copyWith(color: black, fontSize: 14),
        )
      ],
    );
  }
}
