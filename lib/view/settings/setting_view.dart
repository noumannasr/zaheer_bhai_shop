import 'package:bhai_zaheer_shop/view/authentication/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bhai_zaheer_shop/model/dummy_data.dart';
import 'package:bhai_zaheer_shop/res/colors.dart';
import 'package:bhai_zaheer_shop/res/components/app_text.dart';
import 'package:bhai_zaheer_shop/res/components/round_button.dart';


class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.lightGreyColor3,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.orangeColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: TextStylesData.titleFontSize),
        ),
      ),

      body:   SingleChildScrollView(
        child: Column(
          children: [


            SizedBox(
              height: 20,
            ),


            Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/bhai.PNG'),
                  radius: 100,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Zaheer Ahmed', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),
                  ],
                ),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20,bottom: 26,top: 10),
              child: RoundButton(
                width: size.width,
                //isLoading: authViewModel.loading,
                round: 30.0,
                color: AppColors.orangeColor,
                title: 'Logout',
                onPress: () {
                  // Navigator.pushNamed(context, RoutesName.dashView);
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => LoginView(),
                      transitionDuration: Duration(milliseconds: 300),
                      transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                    ),
                  );

                  // Navigator.push(
                  //   context,
                  //   PageRouteBuilder(
                  //     pageBuilder: (context, animation, secondaryAnimation) => PayoutMonthView(),
                  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  //       const begin = Offset(1.0, 0.0);
                  //       const end = Offset.zero;
                  //       const curve = Curves.easeIn;
                  //       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  //       var offsetAnimation = animation.drive(tween);
                  //
                  //       return SlideTransition(position: offsetAnimation, child: child);
                  //     },
                  //   ),
                  // );

                },
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),

          ],
        ),
      ),
    );
  }
}
