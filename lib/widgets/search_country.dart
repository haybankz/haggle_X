import 'package:flutter/material.dart';
import 'package:haggle_x_test/utils/theme.dart';

class SearchCountryWidget extends StatefulWidget {
  final TextEditingController searchController;
  final Function(String) onSubmit;

  SearchCountryWidget(
      {@required this.searchController, @required this.onSubmit});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchCountryWidget> {
  bool searchEmpty = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.searchController.addListener(() {
      if (widget.searchController.text.isEmpty) {
        setState(() {
          searchEmpty = true;
        });
      } else {
        setState(() {
          searchEmpty = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        style: textStyle,
        cursorColor: offWhite,
        keyboardType: TextInputType.text,
        controller: widget.searchController,
        textInputAction: TextInputAction.search,
        onFieldSubmitted: widget.onSubmit,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 21),
          hintText: 'Search for country',
          hintStyle: textStyle,
          fillColor: Color(0xffFFFFFF).withOpacity(0.2),
          filled: true,
          suffixIcon: searchEmpty
              ? Icon(
                  Icons.search,
                  color: textColor,
                  size: 24,
                )
              : GestureDetector(
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback(
                        (_) => widget.searchController.clear());
                    widget.onSubmit("");
                  },
                  child: Icon(
                    Icons.clear,
                    color: offWhite,
                    size: 20,
                  )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24.0),
            ),
            borderSide: BorderSide(
              color: textColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24.0),
            ),
            borderSide: BorderSide(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
