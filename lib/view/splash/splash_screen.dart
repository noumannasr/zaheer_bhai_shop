import 'dart:async';
import 'package:bhai_zaheer_shop/res/colors.dart';
import 'package:bhai_zaheer_shop/view/authentication/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:mec/constants.dart';



class SplashScreen extends StatefulWidget {
  //final Color backgroundColor = Colors.white;
  //final NotificationAppLaunchDetails? notificationAppLaunchDetails;
  const SplashScreen({Key? key, }) : super(key: key);


  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 1; // delay for 5 seconds

  @override
  void initState() {
    super.initState();
   _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginView()));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.orangeColor,
      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 120,
                width: 120,
                child: Image.asset('assets/images/logo1.png', fit: BoxFit.scaleDown,)),
          ],
        ),
      ),
    );
  }
}
