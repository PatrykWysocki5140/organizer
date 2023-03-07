import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizer/models/colors.dart';
import 'package:organizer/widgets/main_bottom_bar/main_bottom_bar_page.dart';
import 'package:provider/provider.dart';

class SplashScreenPage extends StatefulWidget {
  final String _route;
  const SplashScreenPage(this._route);

  @override
  SplashScreenState createState() => SplashScreenState(_route);
}

class SplashScreenState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;
  final String __route;

  SplashScreenState(this.__route);

  startTime() async {
    var _duration = Duration(seconds: 4);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainBottomBar()));
    //Navigator.of(context).pushNamed(__route);
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: navigationPage,
      child: Container(
        // color: GetColors.white,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/tlo2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Image.asset(
                      'assets/images/powered_by.png',
                      height: 75.0,
                      fit: BoxFit.scaleDown,
                    ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo2.png',
                  width: animation.value * 250,
                  height: animation.value * 250,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
