import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:insta_whatsapp/ui/home_page.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  @override
  Widget build(BuildContext context) {

    final pages = [
      Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/onboarding.png'),
            Text(
              'Welcome to InstaWhatsapp',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
      Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.greenAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/onboarding.png'),
            Text(
              'Message people without adding them as contacts',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
      Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.lightBlueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/onboarding.png'),
            GestureDetector(
              onTap: () {
                var hiveBox = Hive.box('insta_whatsapp');
                hiveBox.put('first_run', false);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }),
                );
              },
              child: Text(
                'Click To Get Started',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) => LiquidSwipe(
            pages: pages,
            initialPage: 0,
            enableSlideIcon: true,
            enableLoop: false,
          ),
        ),
      ),
    );
  }
}
