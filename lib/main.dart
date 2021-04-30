
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_x_test/providers/sign_up_provider.dart';
import 'package:haggle_x_test/data/repository/graph_ql_repo.dart';
import 'package:haggle_x_test/locator.dart';
import 'package:haggle_x_test/providers/country_provider.dart';
import 'package:haggle_x_test/providers/login_provider.dart';
import 'package:haggle_x_test/utils/routes.dart';
import 'package:haggle_x_test/utils/theme.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await initHiveForFlutter();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
            create: (context) => LoginProvider(),),
        ChangeNotifierProvider<SignUpProvider>(
          create: (context) => SignUpProvider(),),
        ChangeNotifierProvider<CountryProvider>(
          create: (context) => CountryProvider(),),
      ],
      child: GetMaterialApp(
        title: 'HaggleX Test',
        defaultTransition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 400),
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        theme: appTheme,
        initialRoute: Routes.dashboard,
      ),
    );
  }


}



