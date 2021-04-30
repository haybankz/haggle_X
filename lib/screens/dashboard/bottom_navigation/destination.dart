import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haggle_x_test/utils/theme.dart';

class Destination {
  final String title;
  final Widget icon;
  final Color color;
  final Widget activeIcon;

  Destination({@required this.title, this.icon, this.color, this.activeIcon});
}

//List<Destination> allDestinations = [
//  Destination(title: 'Explore', icon: ImageIcon(AssetImage('assets/icons/explore.png'), size: 24,),),
//  Destination(title: 'Cart', icon: ImageIcon(AssetImage('assets/icons/cart.png'), size: 24,),),
//  Destination(title: 'Cart', icon: SCart(number:  4,),),
//  Destination(title: 'Favourite', icon: ImageIcon(AssetImage('assets/icons/fav.png',), size: 24,),),
//  Destination(title: 'Settings', icon: ImageIcon(AssetImage('assets/icons/settings.png'), size: 24,),),
//];

List<Destination> allDestination = [
  Destination(
    title: 'Home',
    icon: SvgPicture.asset('assets/svg/home.svg', height: 14, width: 14,),
    activeIcon: SvgPicture.asset('assets/svg/home.svg', height: 16, width: 16, color: purple,),
  ),

  Destination(
    title: 'Wallet',
    icon: SvgPicture.asset('assets/svg/wallet.svg', height: 14, width: 14,),
    activeIcon: SvgPicture.asset('assets/svg/wallet.svg', height: 16, width: 16,color: purple,),
  ),

  Destination(
    title: '',
    icon: SvgPicture.asset('assets/svg/otc.svg', height: 20, width: 20, fit: BoxFit.fill,),
    activeIcon: SvgPicture.asset('assets/svg/otc.svg', height: 20, width: 20, fit: BoxFit.fill,),
  ),

  Destination(
    title: 'Cryptosave',
    icon: SvgPicture.asset('assets/svg/save.svg', height: 14, width: 14,),
    activeIcon: SvgPicture.asset('assets/svg/save.svg', height: 16, width: 16,color: purple,),
  ),
  Destination(
    title: 'More',
    icon: SvgPicture.asset('assets/svg/more.svg', height: 14, width: 14),
    activeIcon: SvgPicture.asset('assets/svg/more.svg', height: 16, width: 16, color: purple,),
  ),

];

