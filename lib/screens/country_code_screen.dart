import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haggle_x_test/data/models/active_countries_response_dto.dart';
import 'package:haggle_x_test/providers/country_provider.dart';
import 'package:haggle_x_test/utils/dimension.dart';
import 'package:haggle_x_test/utils/theme.dart';
import 'package:haggle_x_test/widgets/background_widget.dart';
import 'package:haggle_x_test/widgets/search_country.dart';
import 'package:provider/provider.dart';

class CountryCodeScreen extends StatefulWidget {
  @override
  _CountryCodeState createState() => _CountryCodeState();
}

class _CountryCodeState extends State<CountryCodeScreen> {
  CountryProvider _provider;

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<CountryProvider>(context);

    return Scaffold(
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
          child: Column(
            children: [
              SearchCountryWidget(
                  searchController: TextEditingController(),
                  onSubmit: (searchWord) {
                    _provider.filterCountries(searchWord);
                  }),
              Divider(
                color: textColor,
                thickness: 0.5,
                height: 30.0,
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _provider.countries.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      Get.back<Country>(result: _provider.countries[index]);
                    },
                    splashColor: offWhite,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 12, bottom: 12, left: 10, right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 22,
                            width: 32,
                            child: SvgPicture.network(
                              _provider.countries[index]?.flag ?? '',
                              height: 22,
                              width: 30,
                              fit: BoxFit.cover,
                              placeholderBuilder: (_) => Image.asset(
                                'assets/images/app_logo.png',
                                height: 22,
                                width: 30,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          XMargin(14),
                          Text(
                            '(+${_provider.countries[index].callingCode ?? ''}) '
                            '${_provider.countries[index].name ?? ''}',
                            style: textStyle.copyWith(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _provider.resetCountryList();
  }
}
