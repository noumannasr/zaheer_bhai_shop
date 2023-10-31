import 'package:bhai_zaheer_shop/constants.dart';
import 'package:bhai_zaheer_shop/view/products/add_products_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bhai_zaheer_shop/res/colors.dart';
import 'package:bhai_zaheer_shop/res/components/app_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int current = 0;
  int selectedIndex = 1000;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      selectedIndex = 1000;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lightGreyColor3,
      resizeToAvoidBottomInset: true,
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.orangeColor,

        //AppColors.orangeColor.withOpacity(0.75),
        centerTitle: true,
        automaticallyImplyLeading: false,

        title: Text(
          AppText.appName,
          style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: TextStylesData.titleFontSize),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.3,
              width: size.width,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: size.height * 0.3,
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
                                        height: size.height * 0.3,
                                        width: size.width,
                                      ),
                                    ),
                                    Positioned(
                                      top: size.height * 0.117,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Container(
                                          // decoration: BoxDecoration(
                                          //     color:Color(0xFFf8a21b),
                                          //     shape: BoxShape.circle
                                          // ),
                                          width: 80,
                                          height: 80,
                                          child: Image.asset(
                                            'assets/images/curve1.png',
                                            // color: Color(0xFFf9a935),
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/curve4.jpg',
                                      height: 100,
                                      width: 58,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 1, top: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFf8a21b),
                                    shape: BoxShape.circle),
                                width: 100,
                                height: 100,
                                child: Opacity(
                                  opacity: 0.1,
                                  child: Image.asset(
                                    'assets/images/orangeCurve.png',
                                    //color: Colors.white.withOpacity(0.5),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 50),
                          //  color:AppColors.orangeColor.withOpacity(0.5),
                          height: 180,
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Container(
                                  //   child: Image.asset('assets/images/logo.png', height: 100,width: 100,fit: BoxFit.scaleDown,),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 0),
                                    child: Text('Welcome',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                        textAlign: TextAlign.center),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 8),
                                    child: Text('Zaheer Shop!',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        textAlign: TextAlign.center),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                AddProductsScreen(
                                                  docId: '',
                                                  status: 'Add',
                                                  productImage: '',
                                                  productName: '',
                                                  productPrice: '',
                                                  productQuantity: '',
                                                  remainingItems: '',
                                                ))).then((value) {
                                      setState(() {});
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text('+ Add Items',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: size.height * 0.01,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.orangeColor, shape: BoxShape.circle),
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/images/logo1.png',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: size.width * 0.9,
              child: Text(
                'Items',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              height: size.height * 0.75,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                // implement GridView.builder
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Items")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                          child: CircularProgressIndicator(
                        strokeWidth: 1,
                        color: primaryColor,
                      ));
                    } else if (snapshot.hasData &&
                        snapshot.data!.docs.isEmpty) {
                      // got data from snapshot but it is empty

                      return Center(child: Text("No Data Found"));
                    } else {
                      return Center(
                        child: GridView.builder(
                            //physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    //childAspectRatio: 16 / 9,
                                    crossAxisSpacing: 10,
                                    mainAxisExtent: size.height * 0.3,
                                    mainAxisSpacing: 10),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (BuildContext ctx, index) {
                              DocumentSnapshot ds = snapshot.data!.docs[index];
                              //
                              // Timestamp timestamp = ;
                              // DateTime dateTime = ds['date'].toDate();

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                  //Navigator.pushNamed(context, RoutesName.payoutMonth);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              AddProductsScreen(
                                                docId: ds.id.toString(),
                                                status: 'update',
                                                productImage: ds['itemImage'],
                                                productName: ds['itemName'],
                                                productPrice: ds['itemPrice'],
                                                productQuantity:
                                                    ds['itemQuantity'],
                                                remainingItems:
                                                    ds['itemRemaining']
                                                        .toString(),
                                              ))).then((value) {
                                    setState(() {});
                                  });

                                  //CircleDetailView
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    //selectedIndex == index ? AppColors.purpleColor : AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: AppColors.darkGreenColor,
                                        width: 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Center(
                                              child:

                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: CachedNetworkImage(
                                                  height: size.height * 0.18,
                                                  width: size.width,
                                                  fit: BoxFit.cover,
                                                  imageUrl:  ds['itemImage'],
                                                  //   placeholder: (context, url) => CircularProgressIndicator(color: darkRedColor,),
                                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                                ),
                                              ),


                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, top: 0),
                                              child: Container(
                                                color: Colors.white.withOpacity(0.6),

                                                child: Center(
                                                    child: Text(
                                                      ds['date'].toDate().toString().split(' ')[0],
                                                      style: TextStyle(
                                                          color: AppColors.blackColor,
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600),
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0, top: 0),
                                          child: Container(
                                            width: size.width * 0.9,
                                            child: Center(
                                                child: Text(
                                              ds['itemName'],
                                              style: TextStyle(
                                                  color: AppColors.blackColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0, top: 0),
                                          child: Container(
                                            width: size.width * 0.9,
                                            child: Center(
                                                child: Text(
                                              ds['itemRemaining'].toString(),
                                              style: TextStyle(
                                                  color: AppColors.darkRedColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            AddProductsScreen(
                                                              docId: ds.id
                                                                  .toString(),
                                                              status: 'update',
                                                              productImage: ds[
                                                                  'itemImage'],
                                                              productName: ds[
                                                                  'itemName'],
                                                              productPrice: ds[
                                                                  'itemPrice'],
                                                              productQuantity: ds[
                                                                  'itemQuantity'],
                                                              remainingItems:
                                                                  ds['itemRemaining']
                                                                      .toString(),
                                                            ))).then((value) {
                                                  setState(() {});
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0, bottom: 8),
                                                child: Container(
                                                  width: size.width * 0.2,
                                                  decoration: BoxDecoration(
                                                      color: AppColors
                                                          .darkGreenColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Center(
                                                        child: Text(
                                                      'Update',
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title:
                                                          const Text('Delete'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      primaryColor1,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        16.0),
                                                                child:
                                                                    const Text(
                                                                  'Cancel',
                                                                  style: TextStyle(
                                                                      color:
                                                                          whiteColor),
                                                                ),
                                                              )),
                                                        ),
                                                        TextButton(
                                                          onPressed: () async {
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    "Items")
                                                                .doc(snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                    .id
                                                                    .toString())
                                                                .delete()
                                                                .whenComplete(
                                                                    () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      const SnackBar(
                                                                          backgroundColor: Colors
                                                                              .red,
                                                                          content:
                                                                              Text(
                                                                            'Successfully Deleted',
                                                                            style:
                                                                                TextStyle(color: whiteColor),
                                                                          )));
                                                            });
                                                          },
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .red,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        16.0),
                                                                child:
                                                                    const Text(
                                                                  'Delete',
                                                                  style: TextStyle(
                                                                      color:
                                                                          whiteColor),
                                                                ),
                                                              )),
                                                        ),
                                                      ],
                                                      content: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const Text(
                                                              'Are you sure you want to delete?'),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0, bottom: 8),
                                                child: Container(
                                                  width: size.width * 0.2,
                                                  decoration: BoxDecoration(
                                                      color: AppColors
                                                          .darkRedColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Center(
                                                        child: Text(
                                                      'Delete',
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),


                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                  },
                ),
              ),
            ),
            // SizedBox(
            //   height: size.height * 0.2,
            // ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(
        0, size.height); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(
        size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height / 2);
    path.arcTo(
      Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)),
      0,
      -3.14, // 3.14 radians is half a circle
      true,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Half Circle Example'),
        ),
        body: Center(
          child: ClipPath(
            clipper: HalfCircleClipper(),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = new Path();
    path.lineTo(0.0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BezierClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var heightOffset = height * 0.45;
    Path path = Path();
    path.lineTo(0, height - heightOffset);
    path.quadraticBezierTo(width * 0.5, height, width, height - heightOffset);
    path.lineTo(width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
