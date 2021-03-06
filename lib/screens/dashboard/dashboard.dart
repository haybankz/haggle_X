
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haggle_x_test/providers/login_provider.dart';
import 'package:haggle_x_test/screens/dashboard/bottom_navigation/destination.dart';
import 'package:haggle_x_test/screens/dashboard/bottom_navigation/destination_view.dart';
import 'package:haggle_x_test/utils/dimension.dart';
import 'package:haggle_x_test/utils/routes.dart';
import 'package:haggle_x_test/utils/theme.dart';
import 'package:haggle_x_test/widgets/button.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin<DashboardScreen> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
          _showLogout();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,

          //main page view
          child: IndexedStack(
            index: _currentIndex,
            children: allDestination.map<Widget>((Destination destination) {
              return DestinationView(
                destination: destination,
              );
            }).toList(),
          ),
        ),
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.only(top: 60.0),
        //   child: FloatingActionButton(
        //     child: Image.asset('assets/icons/otc.png', height: 90, width: 90, fit: BoxFit.fill, ),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   onPressed: (){},),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        //bottom nav bar
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle:
              textStyle.copyWith(color: purple, fontSize: 10),
          unselectedLabelStyle:
          textStyle.copyWith(color: textColor, fontSize: 10),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: purple,
          selectedIconTheme: IconThemeData(
            color: purple,
          ),
          items: allDestination.map((Destination destination) {
            return BottomNavigationBarItem(
              icon: destination.icon,
              label: destination.title,
              activeIcon: destination.activeIcon,
            );
          }).toList(),
        ),
      ),
    );
  }
}

_showLogout(){
  Get.bottomSheet(
      Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
    children: [
        Container(
          width: 70,
          height: 4,
          decoration: BoxDecoration(
            color: offWhite,
            borderRadius: BorderRadius.circular(2)
          ),
        ),
        YMargin(10),
        Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 65),
          decoration: BoxDecoration(
            color: offWhite,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
            topRight: Radius.circular(30))
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: purple.withOpacity(0.05), shape: BoxShape.circle),
                child: Icon(Icons.compare_arrows_outlined, color: purple, size: 40,)
              ),
              YMargin(20),
              Text("Leaving us so soon?", style: textStyle.copyWith(
                color: black, fontWeight: FontWeight.bold, fontSize: 16
              ),),
              YMargin(30),
              Text("There's always something new to learn on Hagglex. Are you sure you want to exit the app?",
              style: textStyle.copyWith(color: black, fontSize: 13, height: 1.3),),
              YMargin(40),
              Consumer<LoginProvider>(
                builder: (_, provider, child) => SecondaryButtonWidget(text: "YES, PLEASE EXIT", onPressed: (){
                  provider.initLogin();
                  Get.offAllNamed(Routes.login);
                }),
              ),
              YMargin(20)

            ],
          ),
        ),
    ],
  ),
      ),
  ignoreSafeArea: true);
}

