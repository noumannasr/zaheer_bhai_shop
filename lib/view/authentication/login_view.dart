import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bhai_zaheer_shop/res/colors.dart';
import 'package:bhai_zaheer_shop/res/components/app_text.dart';
import 'package:bhai_zaheer_shop/res/components/round_button.dart';
import 'package:bhai_zaheer_shop/utils/utils.dart';
import 'package:bhai_zaheer_shop/view/dashboard/dashboard_view.dart';
import 'package:bhai_zaheer_shop/view/home/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  ValueNotifier obsecurePassword = ValueNotifier(true);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool check = false;
  bool  _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _isLoading = false;
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailAddressController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final authViewModel = Provider.of<AuthViewModel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0,

        // iconTheme: IconThemeData(color: AppColors.blackColor),
        // leading: Icon(Icons.menu, color: AppColors.whiteColor,),
        backgroundColor: AppColors.orangeColor,

        //AppColors.orangeColor.withOpacity(0.75),
        centerTitle: true,
        automaticallyImplyLeading: false,

      ),
      body:  SingleChildScrollView(
        child: Column(children: [
          Container(
            height:size.height*0.3,
            width: size.width,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [

                Container(
                  height:size.height*0.3,
                  width: size.width,
                  child: Stack(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Stack(
                                children: [

                                  ClipPath(
                                    clipper: BezierClipper1(),
                                    child: Container(
                                      color: AppColors.orangeColor,
                                      height:size.height*0.3,
                                      width: size.width,
                                    ),
                                  ),

                                  Positioned(
                                    top: size.height*0.117,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Container(
                                        // decoration: BoxDecoration(
                                        //     color:Color(0xFFf8a21b),
                                        //     shape: BoxShape.circle
                                        // ),
                                        width: 80,
                                        height: 80,
                                        child: Image.asset('assets/images/curve1.png',
                                          // color: Color(0xFFf9a935),
                                          fit: BoxFit.scaleDown,),
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/images/curve4.jpg', height: 100,width: 58,fit: BoxFit.scaleDown,),
                                ],
                              ),
                            ],),

                          Padding(
                            padding: const EdgeInsets.only(right: 1,top: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  color:Color(0xFFf8a21b),
                                  shape: BoxShape.circle
                              ),
                              width: 100,
                              height: 100,

                              child: Opacity(
                                opacity: 0.1,
                                child: Image.asset('assets/images/orangeCurve.png',
                                  //color: Colors.white.withOpacity(0.5),
                                  fit: BoxFit.scaleDown,),
                              ),

                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 40),
                        //  color:AppColors.orangeColor.withOpacity(0.5),
                        height:180,
                        alignment: Alignment.center,
                        child:            Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Container(
                                  child: Image.asset('assets/images/checkBig.png', height: 80,width: 80,fit: BoxFit.scaleDown,color: AppColors.greenColor2,),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, bottom: 0,top: 10),
                                  child: Text('Zaheer Shop', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 20, bottom: 8),
                            //   child: Text('John Doe!', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center),
                            // ),
                            // Row(children: [
                            //   Padding(
                            //     padding: const EdgeInsets.only(left: 20,right: 10),
                            //     child:
                            //     Text('Bronze', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),textAlign: TextAlign.center),
                            //   ),
                            //   ClipRRect(
                            //       borderRadius: BorderRadius.circular(15),
                            //       child: Image.asset('assets/images/start.jpg', width: 25,height: 25,))
                            // ],),
                          ],
                        ),

                      ),
                    ],
                  ),
                ),



                Positioned(
                  bottom: size.height*0.01,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.orangeColor,
                        shape: BoxShape.circle
                    ),
                    width: 100,
                    height: 100,
                    child: Image.asset('assets/images/logo1.png', height: 100,width: 100,fit: BoxFit.cover,),
                  ),
                ),
              ],),
          ),
          Container(
            //            height: size.height,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: size.height * 0.25,
                // ),

                Container(
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)
                      )
                  ),
                  child: Column(
                    children: [

                      // SizedBox(
                      //   height: size.height * 0.04,
                      // ),
                      Container(
                          width: size.width,
                          alignment: Alignment.centerLeft,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              AppText.login,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      SizedBox(
                        height: size.height * 0.03,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: AppColors.lightGreyColor,
                        ),
                        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                        child: TextFormField(
                          controller: _emailAddressController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            // if(EmailValidator.validate(value)) {
                            //   setState(() {
                            //     isValid = true;
                            //   });
                            // } else {
                            //   setState(() {
                            //     isValid = false;
                            //   });
                            // }
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            fillColor: Colors.grey,
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined,color: AppColors.darkBlueColor,),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  //  obsecurePassword.value = !obsecurePassword.value;
                                },
                                child: const Icon(
                                  Icons.verified_outlined,
                                  // color: Colors.,
                                  size: 20,
                                )),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

                            //add prefix icon

                            // errorText: "Error",

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color:  AppColors.lightGreyColor,
                                width: 1,
                              ),
                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color:  AppColors.lightGreyColor,
                                width: 1,
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: AppColors.lightGreyColor, width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle: const TextStyle(
                              color: AppColors.greyColor,
                              fontSize: TextStylesData.smallFontSize,
                              fontFamily: "verdana_regular",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      ValueListenableBuilder(
                          valueListenable: obsecurePassword,
                          builder: (context, value, child) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: AppColors.lightGreyColor,
                              ),

                              margin:

                              const EdgeInsets.only(left: 20, right: 20, top: 0),
                              child: TextFormField(
                                autofocus: true,
                                keyboardType: TextInputType.text,
                                controller: _passwordController,
                                obscureText: obsecurePassword.value ? true : false,
                                textInputAction: TextInputAction.done,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  prefixIcon: Icon(Icons.lock_outline,color: AppColors.darkBlueColor,),
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        obsecurePassword.value = !obsecurePassword.value;
                                      },
                                      child: Icon(
                                        obsecurePassword.value
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility,
                                        size: 20,
                                        color: AppColors.greyColor.withOpacity(0.5),
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color:  AppColors.lightGreyColor,
                                      width: 1,
                                    ),
                                  ),

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color:  AppColors.lightGreyColor,
                                      width: 1,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.lightGreyColor, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  fillColor: Colors.grey,
                                  //labelText: 'Password',
                                  hintText: 'Password',
                                  labelStyle: const TextStyle(
                                    color: AppColors.greyColor,
                                    fontSize: TextStylesData.smallFontSize,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            );
                          }),
                      SizedBox(
                        height: size.height * 0.05,
                      ),

                      Column(children: [
                        _isLoading ?Center(child: CircularProgressIndicator(color: AppColors.orangeColor,)) :
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: RoundButton(
                            width: size.width,
                            //isLoading: authViewModel.loading,
                            round: 30.0,
                            color: AppColors.orangeColor,
                            title: AppText.continueText,
                            onPress: () async {
                              SharedPreferences prefs = await SharedPreferences.getInstance();


                              //  Navigator.pushNamed(context, RoutesName.dashView);

                              if (_emailAddressController.text.isEmpty) {
                                Utils.flushBarErrorMessage('Enter email ', context,
                                    AppColors.darkRedColor, 'Error',3);
                              } else if (_passwordController.text.isEmpty) {
                                Utils.flushBarErrorMessage('Enter password ', context,
                                    AppColors.darkRedColor, 'Error',3);
                              } else if (_passwordController.text.length < 6) {
                                Utils.flushBarErrorMessage(
                                    'Please enter 6 digits password ',
                                    context,
                                    AppColors.darkRedColor,
                                    'Error',3);
                              } else {
                                setState(() {
                                  _isLoading = true;
                                });

                                if (_emailAddressController.text == 'zaheer@gmail.com' && _passwordController.text == '12345678') {

                                  final result =
                                  await _auth.signInWithEmailAndPassword(
                                      email: _emailAddressController.text
                                          .trim()
                                          .toString(),
                                      password: _passwordController.text);
                                  final user = result.user;

                                  prefs.setString(
                                      'userEmail', _emailAddressController.text);
                                  prefs.setString(
                                      'userPassword', _passwordController.text);
                                  prefs.setString('userId', user!.uid);
                                  print('Account creation successful');
                                  setState(() {
                                    _isLoading = false;
                                  });

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => DashboardView(),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        const begin = Offset(1.0, 0.0);
                                        const end = Offset.zero;
                                        const curve = Curves.easeIn;
                                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                        var offsetAnimation = animation.drive(tween);

                                        return SlideTransition(position: offsetAnimation, child: child);
                                      },
                                    ),
                                  );

                                  Utils.flushBarErrorMessage('Successfully Login', context, AppColors.darkGreenColor, 'Success', 2);

                                }
                                else {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  Utils.flushBarErrorMessage(
                                      'U ',
                                      context,
                                      AppColors.darkRedColor,
                                      'Error',3);
                                }


                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),

                      ],),











                    ],
                  ),

                ),


              ],),
          ),
        ],),
      ),





    );
  }
}
