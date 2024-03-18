
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reports/widgets/dots_decorator.dart';
import 'package:reports/widgets/dots_indicator.dart';

class WalkThroughScreen extends StatefulWidget {
  static var tag = "/walk_through4";

  @override
  WalkThroughScreenState createState() => WalkThroughScreenState();
}

class WalkThroughScreenState extends State<WalkThroughScreen> {
  int currentIndexPage = 0;
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
  }

  void onPrev() {
    setState(() {
      if (currentIndexPage >= 1) {
        currentIndexPage = currentIndexPage - 1;
        _controller.jumpToPage(currentIndexPage);
      }
    });
  }

  void onNext() {
    setState(() {
      if (currentIndexPage < 2) {
        currentIndexPage = currentIndexPage + 1;
        _controller.jumpToPage(currentIndexPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var titles = [
      "Latest News Daily",
      "Regular Notifications",
      "Award Winning App"
    ];

    var subTitles = [
      "ProKit – Biggest Flutter UI kit is the ultimate library of Flutter UI templates",
      "ProKit – Biggest Flutter UI kit is the ultimate library of Flutter UI templates combined into a high-quality Flutter UI kit for Android/iOS developers",
      "ProKit – Biggest Flutter UI kit is the ultimate library of Flutter UI templates combined into a high-quality Flutter UI kit for Android/iOS developers. The collection consists of UI elements and styles based on Material Design Guidelines"
    ];

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("images/app/t4_walk_bg.png", width: width * 0.8, height: height * 0.5, fit: BoxFit.fill),
                T4Button(
                        textContent: "Skip",
                        onPressed: () {},
                        isStroked: false,
                      ),
              ],
            ),
            Container(
              width: width,
              height: height,
              child: PageView(
                controller: _controller,
                children: <Widget>[
                  WalkThrough(
                    walkImg:
                        "https://assets.iqonic.design/old-themeforest-images/prokit/images/theme4/t4_walk1.png",
                    title: titles[0],
                    subtitle: subTitles[0],
                  ),
                  WalkThrough(
                    walkImg:
                        "https://assets.iqonic.design/old-themeforest-images/prokit/images/theme4/t4_walk2.png",
                    title: titles[1],
                    subtitle: subTitles[1],
                  ),
                  WalkThrough(
                    walkImg:
                        "https://assets.iqonic.design/old-themeforest-images/prokit/images/theme4/t4_walk3.png",
                    title: titles[2],
                    subtitle: subTitles[2],
                  ),
                ],
                onPageChanged: (value) {
                  setState(() => currentIndexPage = value);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Visibility(
                      visible: currentIndexPage != 0,
                      child: T4Button(
                        textContent: "Prev",
                        onPressed: onPrev,
                        isStroked: true,
                      ),
                    ),
                    DotsIndicator(
                      dotsCount: 3,
                      position: currentIndexPage,
                      decorator: const DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.blue,
                      ),
                    ),
                    T4Button(
                      textContent: "Next",
                      onPressed: onNext,
                      isStroked: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget T4Button({
    required String textContent,
    required VoidCallback onPressed,
    required bool isStroked,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
        alignment: Alignment.center,
        
        decoration: BoxDecoration(
          color: isStroked ? Colors.transparent : Colors.blue,
          borderRadius: BorderRadius.circular(10),
          border: isStroked
              ? Border.all(color: Colors.blue, width: 1)
              : Border.all(color: Colors.transparent),
        ),
        child: Text(
          textContent,
          style: TextStyle(
            color: isStroked ? Colors.blue : Colors.white,
            
          ),
        ),
      ),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }

  Future<void> setStatusBarColor(
    Color statusBarColor, {
    Color? systemNavigationBarColor,
    Brightness? statusBarBrightness,
    Brightness? statusBarIconBrightness,
    int delayInMilliSeconds = 200,
  }) async {
    await Future.delayed(Duration(milliseconds: delayInMilliSeconds));

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        systemNavigationBarColor: systemNavigationBarColor,
        statusBarBrightness: statusBarBrightness,
        statusBarIconBrightness: statusBarIconBrightness,
      ),
    );
  }
}

class WalkThrough extends StatelessWidget {
  final String walkImg;
  final String title;
  final String subtitle;

  const WalkThrough({super.key, 
    required this.walkImg,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width,
      height: height,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: height * 0.05),
            height: height * 0.5,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                CachedNetworkImage( imageUrl: walkImg!, width: width * 0.8, height: height * 0.4),
              ],
            ),
          ),
          SizedBox(height: height * 0.08),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Text(
              subtitle,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

