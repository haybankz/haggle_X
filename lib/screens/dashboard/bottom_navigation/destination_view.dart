import 'package:flutter/material.dart';
import 'package:haggle_x_test/screens/dashboard/bottom_navigation/destination.dart';
import 'package:haggle_x_test/screens/home_screen.dart';

class DestinationView extends StatelessWidget {

  final Destination destination;

  DestinationView({@required this.destination});

//   @override
//   _DestinationView createState() => _DestinationView();
// }
//
// class _DestinationView extends State<DestinationView> {
//
//   TextEditingController controller = TextEditingController();
//
//
//

  @override
  Widget build(BuildContext context) {
    switch(destination.title){
      case 'Home': return HomeScreen();

      case 'Wallet':
        return Container();


      case '':
        return Container();

      case 'Cryptosave': return Container();

      case 'More': return Container();

      // case 'Settings': return SettingsScreen();

      default: return Container(
          child: Center(
            child: Text('${destination.title}'),
          )
        );


    }
  }
}