import 'dart:io';
import 'dart:math';
import 'package:bhai_zaheer_shop/constants.dart';
import 'package:bhai_zaheer_shop/res/colors.dart';
import 'package:bhai_zaheer_shop/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProductsScreen extends StatefulWidget {
  final String status;
  final String productName;
  final String productImage;
  final String remainingItems;
  final String productPrice;
  final String docId;
  final String productQuantity;
  const AddProductsScreen({Key? key,
    required this.status,
    required this.docId,
    required this.productImage,
    required this.productPrice,
    required this.remainingItems,
    required this.productName,
    required this.productQuantity,
  }) : super(key: key);

  @override
  _AddProductsScreenState createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  final TextEditingController _productNameControoler = TextEditingController();
  final TextEditingController _productPriceControoler = TextEditingController();
  final TextEditingController _productQuantity = TextEditingController();
  final TextEditingController _saledItems = TextEditingController();
  bool _isLoading = false, isCustomized = true;
  bool _isImageLoading = false;
  String isClassNameExist = '', productCode = '' , email = '', name = '', uid = '', remainingItems = '';



  String categoryImage = '';
  PickedFile? pickedFile;

  @override
  void initState() {
    // TODO: implement initState


    if(widget.status == 'update') {
      //getData(widget.selectedInstructor.toString());
      setState(() {
        _productNameControoler.text = widget.productName;
        _productQuantity.text = widget.remainingItems;
        _productPriceControoler.text = widget.productPrice;
        categoryImage = widget.productImage;
        isClassNameExist = 'yes';
        _isLoading = false;
        isCustomized = true;
      });
    } else {
      setState(() {
        isClassNameExist = '';
        productCode = '';
        _isLoading = false;
        isCustomized = true;
      });
    }

    //getData();
    super.initState();
  }

  _imgFromCamera(bool isProfile) async {


    pickedFile = (await ImagePicker.platform
        .pickImage(source: ImageSource.camera, imageQuality: 50))!;
    setState(() {
      _isImageLoading = true;
    });
    getUrl(pickedFile!.path).then((value1) {
      setState(() {
        categoryImage = value1.toString();
        _isImageLoading = false;
        print(pickedFile!.path.toString());
      });
    });


  }

  _imgFromGallery(bool isProfile) async {
    // FilePickerResult? picked = await FilePicker.platform.pickFiles(

    pickedFile = (await ImagePicker.platform
        .pickImage(source: ImageSource.gallery, imageQuality: 50));

    final file = File(pickedFile!.path);

    setState(() {
      _isImageLoading = true;
    });

    getUrl(pickedFile!.path).then((value1) {
      setState(() {
        categoryImage = value1.toString();
        _isImageLoading = false;
        print(pickedFile!.path.toString());
      });
    });




  }

  void _showPicker(context, bool isProfile) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {

                        _imgFromGallery(isProfile);

                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {

                      _imgFromCamera(isProfile);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<String?> getUrl(String path) async {
    final file = File(path);
    TaskSnapshot snapshot = await FirebaseStorage.instance
        .ref()
        .child("audio" + DateTime.now().toString())
        .putFile(file);
    if (snapshot.state == TaskState.success) {
      return await snapshot.ref.getDownloadURL();
    }

  }

  getData(String name1) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // FirebaseFirestore.instance.collection('Items').doc('name', isEqualTo: name1.toString()).get().then((value) {
    //   // value['email'];
    //   setState(() {
    //     email = value.docs[0]['email'].toString();
    //     name = value.docs[0]['name'].toString();
    //     uid = value.docs[0]['uid'].toString();
    //   });
    // });
    print(email.toString());
    print(name.toString());
    print(uid.toString());

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: lightGreyColor,
      appBar: AppBar(

        iconTheme: IconThemeData(color: whiteColor, size: 25),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: secondaryColor1,
        title: Text(
          widget.status == 'update' ? 'Update Item' : 'Add Item',
          style: titleWhite,
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 0,
              ),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: greyColor, width: 0.5),
                    color: whiteColor,
                  ),
                  width: size.width * 0.85,
                  child: TextFormField(
                    controller: _productNameControoler,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      // prefixIcon: Icon(
                      //   Icons.wysiwyg_sharp,
                      //   color: primaryColor,
                      // ),
                      border: InputBorder.none,
                      fillColor: whiteColor,
                      contentPadding:
                      EdgeInsets.only(left: 9.0, top: 13, bottom: 13),
                      hintText: 'Item Name',
                      hintStyle: TextStyle(color: greyColor),
                    ),
                    onChanged: (String value) {},
                  )),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),

            Padding(
              padding: const EdgeInsets.only(
                top: 0,
              ),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: greyColor, width: 0.5),
                    color: whiteColor,
                  ),
                  width: size.width * 0.85,
                  child: TextFormField(
                    controller: _productPriceControoler,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      // prefixIcon: Icon(
                      //   Icons.wysiwyg_sharp,
                      //   color: primaryColor,
                      // ),
                      border: InputBorder.none,
                      fillColor: whiteColor,
                      contentPadding:
                      EdgeInsets.only(left: 9.0, top: 13, bottom: 13),
                      hintText: 'Price per item',
                      hintStyle: TextStyle(color: greyColor),
                    ),
                    onChanged: (String value) {},
                  )),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),

            Padding(
              padding: const EdgeInsets.only(
                top: 0,
              ),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: greyColor, width: 0.5),
                    color: whiteColor,
                  ),
                  width: size.width * 0.85,
                  child: TextFormField(
                    controller: _productQuantity,
                    keyboardType: TextInputType.number,

                    obscureText: false,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: whiteColor,
                      contentPadding:
                      EdgeInsets.only(left: 9.0, top: 13, bottom: 13),
                      hintText: 'Item Quantity',
                      hintStyle: TextStyle(color: greyColor),
                    ),
                    onChanged: (String value) {},
                  )),
            ),



            SizedBox(
              height: size.height * 0.01,
            ),
            widget.status == 'update' ?
            Padding(
              padding: const EdgeInsets.only(
                top: 0,
              ),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: greyColor, width: 0.5),
                    color: whiteColor,
                  ),
                  width: size.width * 0.85,
                  child: TextFormField(
                    controller: _saledItems,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: whiteColor,
                      contentPadding:
                      EdgeInsets.only(left: 9.0, top: 13, bottom: 13),
                      hintText: 'Sold Items Quantity',
                      hintStyle: TextStyle(color: greyColor),
                    ),
                    onChanged: (String value) {},
                  )),
            ) : SizedBox(),
            SizedBox(
              height: size.height * 0.01,
            ),


            Column(children: [

              categoryImage.toString() != "" ? Container() :
              GestureDetector(
                onTap: (){
                  _showPicker(context, true);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(

                      //height: 40,
                      //width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10
                          ),
                          border: Border.all(color: primaryColor,width: 1)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: const Text(
                          'Upload Product Image',
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // SizedBox(
              //   height: size.height*0.05,
              // ),

              //   categoryImage.toString() == "" ? Container() :
              _isImageLoading ? Center(child: CircularProgressIndicator()) :
              categoryImage.toString() == "" ? Container() :
              Container(
                alignment:
                Alignment
                    .center,
                height: 200,
                width: 200,
                decoration:
                BoxDecoration(
                  //color: kLightBlueColor,
                ),
                child:

                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      padding:
                      EdgeInsets.only(left: 0),
                      decoration: BoxDecoration(
                        // color: kLightBlueColor,
                      ),
                      child: categoryImage.toString() == "" ? Container() :
                      ClipRRect(
                        borderRadius:
                        BorderRadius.circular(10),
                        child:

                        Image.network(categoryImage.toString() ,
                          height: size.height*0.3,
                          width: size.width*0.5,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(

                      //right: 0,
                      //left: 50,,

                      child:
                      Container(
                          height: size.height*0.3,
                          // width: devSize.width*0.035,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap:
                                    () {
                                  //auth.getPictureID(context);
                                },
                                child:
                                MaterialButton(
                                  onPressed:
                                      () async {
                                    setState(() {
                                      categoryImage = "";
                                    });
                                  },
                                  color:
                                  Colors.red,
                                  textColor:
                                  Colors.white,
                                  child:
                                  Icon(
                                    Icons.cancel,
                                    size: 20,
                                  ),
                                  minWidth: size.width * 0.035,
                                  padding:
                                  EdgeInsets.all(0),
                                  shape:
                                  CircleBorder(),
                                ),
                              ),
                            ],)

                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: size.height*0.02,
              ),


            ],),

            SizedBox(
              height: size.height * 0.01,
            ),



            _isLoading
                ? CircularProgressIndicator(
              color: primaryColor,
              strokeWidth: 2,
            )
                : SizedBox(
              height: size.height * 0.06,
              width: size.width * 0.85,
              child: ElevatedButton(
                  onPressed: () async {
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SingnIn()));

                    if (_productNameControoler.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const  SnackBar(
                              content:  Text('Enter Item Name')
                          )
                      );

                    }
                else if (_productPriceControoler.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const  SnackBar(
                              content:  Text('Enter Item Price')
                          )
                      );

                    }
                    else if (_productQuantity.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const  SnackBar(
                              content:  Text('Enter Item Quantity')
                          )
                      );

                    }
                    else if (_saledItems.text.isEmpty && widget.status == 'update') {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const  SnackBar(
                              content:  Text('Enter Sold Items Quantity')
                          )
                      );

                    }

                    else {


                      if (int.parse(_productQuantity.text) <= 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const  SnackBar(
                                content:  Text('Enter valid item quantity ')
                            )
                        );
                      } else {
                        setState(() {
                          _isLoading = true;
                        });
                        if(widget.status == 'update') {

                          if(int.parse(_saledItems.text.toString()) > 0 && int.parse(_saledItems.text.toString()) <= int.parse(widget.remainingItems.toString()) )

                          {

                            FirebaseFirestore.instance
                                .collection('Items')
                                .doc(widget.docId.toString())
                                .update({
                              "itemName": _productNameControoler.text,
                              "itemImage": categoryImage.toString(),
                              "itemPrice": _productPriceControoler.text.toString(),
                              "itemRemaining": int.parse(widget.remainingItems.toString()) - int.parse(_saledItems.text.toString()),
                              //  "currentlyAddedStudents": widget.currentStudents,
                            }).then((value) {
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const  SnackBar(
                                      backgroundColor: Colors.blue,
                                      content:  Text('Item updated successfully',style: TextStyle(color: whiteColor),)
                                  )
                              );
                            });

                          } else {
                            setState(() {
                              _isLoading = false;
                            });

                            Utils.flushBarErrorMessage(
                                _saledItems.text.toString() == '0' ? 'Sorry sold items count cannot be 0' :

                                'Sorry sold items count is greater than remaining items', context, AppColors.darkRedColor, 'Error', 2);


                          }



                        }
                        else {

                          final snapshot = await FirebaseFirestore.instance
                              .collection('Items')
                              .get();
                          snapshot.docs.forEach((element) {
                            print('user data');
                            if (element['itemName'] ==
                                _productNameControoler.text.toString().trim()) {
                              print('user age in if of current user ');
                              //   print(element['age']);
                              setState(() {
                                isClassNameExist = 'yes';
                              });
                            }
                          });

                          if (isClassNameExist == 'yes') {
                            setState(() {
                              _isLoading = false;
                            });
                            Utils.flushBarErrorMessage('Item name already exists', context, AppColors.darkRedColor, 'Error', 2);

                          }
                          else {
                            FirebaseFirestore.instance
                                .collection('Items')
                                .doc()
                                .set({
                              "itemName": _productNameControoler.text,
                              "itemImage": categoryImage.toString(),
                              "itemPrice": _productPriceControoler.text.toString(),
                              "itemQuantity": _productQuantity.text.toString(),
                              "itemRemaining": _productQuantity.text.toString(),
                              "date": DateTime.now(),

                            }).then((value) {
                              setState(() {
                                _isLoading = false;
                              });

                              Navigator.of(context).pop();

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const  SnackBar(
                                      backgroundColor: Colors.green,
                                      content:  Text('Item Added Successfully',style: TextStyle(color: whiteColor),)
                                  )
                              );
                            });
                          }
                        }
                      }


                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  child: Text(
                      widget.status == 'update' ? 'Update':
                      "Add", style: subtitleWhite)),
            ),

            SizedBox(
              height: size.height*0.05,
            ),

          ],
        ),
      ),

    );
  }
}
