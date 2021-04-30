import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haggle_x_test/utils/dimension.dart';
import 'package:haggle_x_test/utils/theme.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: purple,
              width: screenWidth(context),
              // height: screenHeight(context, percent: 25),
              padding:
                  EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: purple,
                            border: Border.all(color: offWhite)),
                        child: Image.asset(
                          "assets/images/app_logo.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                      Text(
                        "HaggleX",
                        style: textStyle.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      _NotificationIconWidget()
                    ],
                  ),
                  YMargin(40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total portfolio balance',
                        style: textStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w300),
                      ),
                      YMargin(6),
                      Row(
                        children: [
                          Text(
                            r"$****",
                            style: textStyle.copyWith(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      // YMargin(20),
                    ],
                  ),
                ],
              ),
            ),
            _CarouselWidget(),
            YMargin(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XMargin(screenWidth(context)),
                  Text(
                    "Markets",
                    style: textStyle.copyWith(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  ListView.separated(
                    physics: ScrollPhysics(),
                    separatorBuilder: (BuildContext context, index) => Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: new Divider(
                        color: Colors.grey[400],
                      ),
                    ),
                    shrinkWrap: true,
                    itemCount: Coin.coinList.length,
                    itemBuilder: (context, i) {
                      Coin coin = Coin.coinList[i];
                      return Row(children: [
                        SvgPicture.asset("assets/svg/${coin.icon}",
                            height: 40, width: 40),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${coin.name ?? ''} (${coin.ticker ?? ''})',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                                YMargin(4),
                                Row(children: [
                                  Text(
                                    'NGN ${coin.price}',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.grey[700]),
                                  ),
                                  XMargin(6),
                                  Text('+${coin.changePercent}%',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff52CB35))),
                                ]),
                              ],
                            ),
                          ),
                        ),
                        SvgPicture.asset('assets/svg/${coin.graphIcon}',
                            height: 20, width: 40)

                      ],);

                    },
                  ),
                  YMargin(6),
                  Divider(
                    color: Colors.grey[400],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, right: 12, left: 12, bottom: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Do more with HaggleX',
                          style: textStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: black))),
                  YMargin(10),
                  _DoMoreWidget(
                      title: 'Send money instantly',
                      subTitle: 'Send crypto to another wallet',
                      icon: 'send.svg'),
                  _DoMoreWidget(
                      title: 'Receive money from anyone',
                      subTitle: 'Receive crypto from another wallet',
                      icon: 'receive.svg'),
                  _DoMoreWidget(
                      title: 'Virtual Card',
                      subTitle: 'Make faster payments using HaggleX cards',
                      icon: 'send.svg'),
                  _DoMoreWidget(
                      title: 'Global Remittance',
                      subTitle: 'Send money to anyone, anywhere',
                      icon: 'receive.svg'),
                ],
              ),
            ),
            YMargin(15),
            Container(color: Colors.grey[100], height: 10),


            Column(
              //  mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Trending crypto news",
                    style: textStyle.copyWith(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),)
                ),
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return ListTile(
                      // leading: Container(color: Colors.red, height: 50, width: 50),
                      leading: Image.asset('assets/images/news.png'),
                      //     height: 100, width: 60),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 0.0, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            YMargin(10),
                            Text(
                                'Blockchain Bites: BTC on Ethereum, DeFi’s latest stablecoin, the currency cold wars',
                                style:  textStyle.copyWith(
                                color: black,
                                fontSize: 14),),
                            YMargin(14),
                            Row(children: [
                              Text(
                                '6hrs ago',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey[600]),
                              ),
                              XMargin(50),
                              Text('Category:',
                                  style: TextStyle(
                                      fontSize: 9, color: Colors.grey[600])),
                              Text(' DeFi', style: TextStyle(fontSize: 10))
                            ]),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            YMargin(30),

            Container(height: 1, color: Colors.grey[200]),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('View all Stories',
                        style: TextStyle(color: Colors.black)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Icon(Icons.chevron_right),
                  )
                ],
              ),
            ),
            Container(height: 1, color: Colors.grey[200]),

            YMargin(40)
          ],
        ),
      ),
    );
  }
}

class _DoMoreWidget extends StatelessWidget {
  final String title, subTitle, icon;
  const _DoMoreWidget(
      {@required this.title, @required this.subTitle, this.icon})
      : assert(title != null && subTitle != null && icon != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shadowColor: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: purple.withOpacity(0.05), shape: BoxShape.circle),
              child:
                  SvgPicture.asset('assets/svg/$icon', height: 40, width: 40),
            ),
            XMargin(6),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: textStyle.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: black)),
                  YMargin(4),
                  Text(subTitle,
                      style: textStyle.copyWith(fontSize: 10, color: black))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _NotificationIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.only(right: 4, top: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: offWhite.withOpacity(0.1),
            ),
            child: Icon(
              Icons.notifications,
              color: offWhite,
              size: 18,
            ),
          ),
          _buildIndicator(),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return Positioned(
      top: -2,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(3.5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: Text(
          '5',
          style: textStyle.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}

class _CarouselWidget extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<_CarouselWidget> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context),
      height: screenHeight(context, percent: 20),
      child: PageView(
        allowImplicitScrolling: true,
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/market.png",
              width: screenWidth(context),
              height: screenHeight(context, percent: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/save.png",
              width: screenWidth(context),
              height: screenHeight(context, percent: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/giveaway.png",
              width: screenWidth(context),
              height: screenHeight(context, percent: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/challenge.png",
              width: screenWidth(context),
              height: screenHeight(context, percent: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class Coin {
  String icon;
  String name;
  String ticker;
  String price;
  double changePercent;
  String graphIcon;

  Coin(
      {@required this.icon,
      @required this.name,
      @required this.ticker,
      @required this.price,
      @required this.changePercent,
      @required this.graphIcon});

  static List<Coin> coinList = [
    Coin(
        icon: 'hag.svg',
        name: 'Haggle',
        ticker: 'HAG',
        price: '380',
        changePercent: 0,
        graphIcon: 'graph_hag.svg'),
    Coin(
        icon: 'hag.svg',
        name: 'Bitcoin',
        ticker: 'BTC',
        price: '4,272,147.00',
        changePercent: 2.34,
        graphIcon: 'graph_btc.svg'),
    Coin(
        icon: 'hag.svg',
        name: 'Ethereum',
        ticker: 'ETH',
        price: '4,272,147.00',
        changePercent: 2.34,
        graphIcon: 'graph_eth.svg'),
    Coin(
        icon: 'usdt.svg',
        name: 'Tether',
        ticker: 'USDT',
        price: '4,272,147.00',
        changePercent: 2.34,
        graphIcon: 'graph_usdt.svg'),
    Coin(
        icon: 'hag.svg',
        name: 'Bitcoin Cash',
        ticker: 'BCH',
        price: '4,272,147.00',
        changePercent: 2.34,
        graphIcon: 'graph_bch.svg'),
    Coin(
        icon: 'hag.svg',
        name: 'Dodgecoin',
        ticker: 'DOGE',
        price: '4,272,147.00',
        changePercent: 2.34,
        graphIcon: 'graph_doge.svg'),
    Coin(
        icon: 'hag.svg',
        name: 'Litecoin',
        ticker: 'LTC',
        price: '4,272,147.00',
        changePercent: 2.34,
        graphIcon: 'graph_ltc.svg'),
  ];
}
