import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/ui/auth/model/CommonModel.dart';
import 'package:sb_portal/ui/dashboard/model/AddProductModel.dart';
import 'package:sb_portal/ui/dashboard/model/ProductCategoryModel.dart';
import 'package:sb_portal/ui/dashboard/provider/HomeProvider.dart';
import 'package:sb_portal/ui/dashboard/view/HomeNavigationScreen.dart';
import 'package:sb_portal/ui/dashboard/view/without_login/WithoutLoginNavigation.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/app_string.dart';
import 'package:sb_portal/utils/app_widgets.dart';
import 'package:sb_portal/utils/preference_helper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/NavKey.dart';

class AddProductScreen extends StatefulWidget {
  bool isProductAdd;
  bool isFromSealsAdmin;

  AddProductScreen({Key? key, this.isProductAdd = false, this.isFromSealsAdmin = false}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  HomeProvider? mHomeProvider;
  TextEditingController prodNameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  FocusNode prodNameFocus = FocusNode();
  FocusNode descFocus = FocusNode();

  File? imageUrlOne;
  File? imageUrlTwo;
  File? imageUrlThree;
  File? imageUrlFour;
  File? imageUrlFive;
  File? imageUrlSix;

  ProductCategoryModel productCategoryModel = ProductCategoryModel();
  Category? categoryData;

  @override
  void initState() {
    callProductCategoryListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mHomeProvider = Provider.of<HomeProvider>(context);
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: mHomeProvider!.isRequestSend,
        child: Scaffold(
          backgroundColor: AppColors.colorWhite,
          body: !widget.isProductAdd
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 32),
                        Text('Add Product', style: AppFont.NUNITO_BOLD_DARK_CHARCOALBLACK_20),
                        const SizedBox(height: 16),
                        AppWidgets.buildInputFields(
                          prodNameController,
                          "Product Name",
                          false,
                          prodNameFocus,
                          null,
                          context,
                        ),
                        const SizedBox(height: 16),
                        productCategoryModel.results != null
                            ? DropdownButton<Category>(
                                hint: categoryData == null ? const Text('Select Product Category') : Text(categoryData!.categoryName!),
                                underline: Container(),
                                isExpanded: true,
                                items: productCategoryModel.results!.category!.map((Category value) {
                                  return DropdownMenuItem<Category>(
                                    value: value,
                                    child: Text(value.categoryName!),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    categoryData = newValue;
                                  });
                                },
                              )
                            : const SizedBox(),
                        Container(
                          height: 1,
                          width: double.maxFinite,
                          color: AppColors.colorGreyish,
                        ),
                        const SizedBox(height: 32),
                        AppWidgets.buildCommentInputFields(descController, "Description", false, descFocus, null, context,
                            textInputAction: TextInputAction.done),
                        const SizedBox(height: 32),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                _onImagePickTap(context, '1');
                              },
                              child: Container(
                                height: 100,
                                width: 120,
                                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                decoration: BoxDecoration(
                                  color: AppColors.colorLightBlueGrey,
                                  border: Border.all(color: AppColors.colorBorder, width: 1.0),
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                ),
                                child: imageUrlOne == null
                                    ? Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.add,
                                          ),
                                          SizedBox(height: 4),
                                          Text('Select Image')
                                        ],
                                      )
                                    : Image.file(imageUrlOne!, fit: BoxFit.fill),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                              ),
                            ),
                            const SizedBox(width: 16),
                            InkWell(
                              onTap: () {
                                _onImagePickTap(context, '2');
                              },
                              child: Container(
                                height: 100,
                                width: 120,
                                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                decoration: BoxDecoration(
                                  color: AppColors.colorLightBlueGrey,
                                  border: Border.all(color: AppColors.colorBorder, width: 1.0),
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                ),
                                child: imageUrlTwo == null
                                    ? Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.add,
                                          ),
                                          SizedBox(height: 4),
                                          Text('Select Image')
                                        ],
                                      )
                                    : Image.file(imageUrlTwo!, fit: BoxFit.fill),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                _onImagePickTap(context, '3');
                              },
                              child: Container(
                                height: 100,
                                width: 120,
                                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                decoration: BoxDecoration(
                                  color: AppColors.colorLightBlueGrey,
                                  border: Border.all(color: AppColors.colorBorder, width: 1.0),
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                ),
                                child: imageUrlThree == null
                                    ? Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.add,
                                          ),
                                          SizedBox(height: 4),
                                          Text('Select Image')
                                        ],
                                      )
                                    : Image.file(imageUrlThree!, fit: BoxFit.fill),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                              ),
                            ),
                            const SizedBox(width: 16),
                            InkWell(
                              onTap: () {
                                _onImagePickTap(context, '4');
                              },
                              child: Container(
                                height: 100,
                                width: 120,
                                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                decoration: BoxDecoration(
                                  color: AppColors.colorLightBlueGrey,
                                  border: Border.all(color: AppColors.colorBorder, width: 1.0),
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                ),
                                child: imageUrlFour == null
                                    ? Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.add,
                                          ),
                                          SizedBox(height: 4),
                                          Text('Select Image')
                                        ],
                                      )
                                    : Image.file(imageUrlFour!, fit: BoxFit.fill),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                _onImagePickTap(context, '5');
                              },
                              child: Container(
                                height: 100,
                                width: 120,
                                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                decoration: BoxDecoration(
                                  color: AppColors.colorLightBlueGrey,
                                  border: Border.all(color: AppColors.colorBorder, width: 1.0),
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                ),
                                child: imageUrlFive == null
                                    ? Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.add,
                                          ),
                                          SizedBox(height: 4),
                                          Text('Select Image')
                                        ],
                                      )
                                    : Image.file(imageUrlFive!, fit: BoxFit.fill),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                              ),
                            ),
                            const SizedBox(width: 16),
                            InkWell(
                              onTap: () {
                                _onImagePickTap(context, '6');
                              },
                              child: Container(
                                height: 100,
                                width: 120,
                                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                decoration: BoxDecoration(
                                  color: AppColors.colorLightBlueGrey,
                                  border: Border.all(color: AppColors.colorBorder, width: 1.0),
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                ),
                                child: imageUrlSix == null
                                    ? Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.add,
                                          ),
                                          SizedBox(height: 4),
                                          Text('Select Image')
                                        ],
                                      )
                                    : Image.file(imageUrlSix!, fit: BoxFit.fill),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: GestureDetector(
                            child: Material(
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.colorOrange,
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                child: MaterialButton(onPressed: null, child: Text('ADD PRODUCT', style: AppFont.NUNITO_BOLD_WHITE_24)),
                              ),
                            ),
                            onTap: () {
                              isValid();
                            },
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      APPImages.icSplashLogo,
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Thank you for adding your \nproduct as a Seller on Alang World.',
                      style: AppFont.NUNITO_REGULAR_BLACK_18,
                      strutStyle: StrutStyle(fontSize: AppFont.NUNITO_REGULAR_BLACK_18.fontSize),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'We will Verify the product added by you in next 24 hours and the same will be uploaded under your products.',
                          // 'Our Customer Support Executive Will\nVerify Your Product in next 24 Hours \nFor necessary Verification &\nOn Boarding...\'',
                          strutStyle: StrutStyle(fontSize: AppFont.NUNITO_REGULAR_BLACK_14.fontSize),
                          style: AppFont.NUNITO_REGULAR_BLACK_14,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Contact Us:',
                          style: AppFont.NUNITO_REGULAR_DARK_BLACK_16,
                        ),
                        const SizedBox(width: 2),
                        InkWell(
                          onTap: () {
                            _openUrl('mailto:${'info@alangworld.com'}');
                          },
                          child: const Text(
                            'info@alangworld.com',
                            style: TextStyle(decoration: TextDecoration.underline, color: AppColors.colorBlue, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Customer Care:',
                          style: AppFont.NUNITO_REGULAR_DARK_BLACK_16,
                        ),
                        const SizedBox(width: 2),
                        InkWell(
                          onTap: () {
                            _openUrl('tel:${'+919510264074'}');
                          },
                          child: const Text(
                            '+91 9510264074',
                            style: TextStyle(decoration: TextDecoration.underline, color: AppColors.colorBlue, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: () {
                        NavKey.navKey.currentState!.pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (_) => HomeScreenNavigation(
                                      selectedIndex: 0,
                                    )),
                            (route) => false);
                      },
                      child: const Text(
                        'BACK TO HOME',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Future<void> _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> getImageFromGallery(String type) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      File? croppedFile = await ImageCropper().cropImage(
          sourcePath: image.path,
          aspectRatioPresets: [CropAspectRatioPreset.square],
          cropStyle: CropStyle.rectangle,
          compressQuality: 80,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: AppColors.colorWhite,
            toolbarWidgetColor: AppColors.colorLightBrown,
            dimmedLayerColor: AppColors.colorWhite.withOpacity(0.5),
            toolbarTitle: 'Crop image',
            statusBarColor: Colors.transparent,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true,
            hideBottomControls: true,
          ),
          iosUiSettings: const IOSUiSettings(
            minimumAspectRatio: 2.0,
            rotateButtonsHidden: true,
          ));
      if (croppedFile != null) {
        setState(() {
          if (type == '1') {
            imageUrlOne = File(croppedFile.path);
          } else if (type == '2') {
            imageUrlTwo = File(croppedFile.path);
          } else if (type == '3') {
            imageUrlThree = File(croppedFile.path);
          } else if (type == '4') {
            imageUrlFour = File(croppedFile.path);
          } else if (type == '5') {
            imageUrlFive = File(croppedFile.path);
          } else if (type == '6') {
            imageUrlSix = File(croppedFile.path);
          }
        });
      }
    }
  }

  Future<void> getImageFromCamera(String type) async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image != null) {
      File? croppedFile = await ImageCropper().cropImage(
          sourcePath: image.path,
          aspectRatioPresets: [CropAspectRatioPreset.square],
          cropStyle: CropStyle.rectangle,
          compressQuality: 80,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: AppColors.colorWhite,
            toolbarWidgetColor: AppColors.colorLightBrown,
            dimmedLayerColor: AppColors.colorWhite.withOpacity(0.5),
            toolbarTitle: 'Crop image',
            statusBarColor: Colors.transparent,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true,
            hideBottomControls: true,
          ),
          iosUiSettings: const IOSUiSettings(
            minimumAspectRatio: 2.0,
            rotateButtonsHidden: true,
          ));
      if (croppedFile != null) {
        setState(() {
          if (type == '1') {
            imageUrlOne = File(croppedFile.path);
          } else if (type == '2') {
            imageUrlTwo = File(croppedFile.path);
          } else if (type == '3') {
            imageUrlThree = File(croppedFile.path);
          } else if (type == '4') {
            imageUrlFour = File(croppedFile.path);
          } else if (type == '5') {
            imageUrlFive = File(croppedFile.path);
          } else if (type == '6') {
            imageUrlSix = File(croppedFile.path);
          }
        });
      }
    }
  }

  void _onImagePickTap(BuildContext context, String type) {
    var viewGallery = GestureDetector(
        onTap: () {
          Navigator.of(context, rootNavigator: true).pop();
          getImageFromGallery(type);
        },
        child: Material(
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.colorWhite, borderRadius: BorderRadius.only(topRight: Radius.circular(8.0), topLeft: Radius.circular(8.0))),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 6,
                ),
                const Icon(
                  Icons.collections,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: Text(
                  'Gallery',
                  style: AppFont.NUNITO_REGULAR_BLACK_14,
                ))
              ],
            ),
          ),
        ));

    var viewCamera = GestureDetector(
        onTap: () {
          Navigator.of(context, rootNavigator: true).pop();
          getImageFromCamera(type);
        },
        child: Material(
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.colorWhite, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0))),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 6,
                ),
                const Icon(
                  Icons.photo_camera,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: Text(
                  'Camera',
                  style: AppFont.NUNITO_REGULAR_BLACK_14,
                ))
              ],
            ),
          ),
        ));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Align(
            child: Container(
              alignment: Alignment.center,
              height: 150,
              width: (MediaQuery.of(context).size.width / 100.0) * 80,
              child: Column(
                children: <Widget>[viewGallery, viewCamera],
              ),
            ),
          );
        });
  }

  isValid() {
    if (prodNameController.text.toString().trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please Enter Product Name');
    } else if (categoryData == null) {
      Fluttertoast.showToast(msg: 'Please Enter Product Category');
    } else if (descController.text.toString().trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please Enter Product Description');
    } else if (imageUrlOne == null &&
        imageUrlTwo == null &&
        imageUrlThree == null &&
        imageUrlFour == null &&
        imageUrlFive == null &&
        imageUrlSix == null) {
      Fluttertoast.showToast(msg: 'Please Add at least one image');
    } else {
      callAddProductApi();
    }
  }

  callAddProductApi() async {
    String sellerID = PreferenceHelper.getString(PreferenceHelper.SELLER_ID);
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      Map<String, String> body = {
        APPStrings.paramSellerId: sellerID,
        APPStrings.paramProductName: prodNameController.text.toString(),
        APPStrings.paramCatagoryId: categoryData!.id.toString(),
        APPStrings.paramDescription: descController.text.toString(),
      };
      List<String> listOfImage = [];
      if (imageUrlOne != null) {
        listOfImage.add(imageUrlOne!.path);
      }
      if (imageUrlTwo != null) {
        listOfImage.add(imageUrlTwo!.path);
      }
      if (imageUrlThree != null) {
        listOfImage.add(imageUrlThree!.path);
      }
      if (imageUrlFour != null) {
        listOfImage.add(imageUrlFour!.path);
      }
      if (imageUrlFive != null) {
        listOfImage.add(imageUrlFive!.path);
      }
      if (imageUrlSix != null) {
        listOfImage.add(imageUrlSix!.path);
      }

      mHomeProvider!.addProduct(body, listOfImage).then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              AddProductModel addProductModel = AddProductModel.fromJson(value);
              Fluttertoast.showToast(msg: addProductModel.message!);
              if (widget.isFromSealsAdmin) {
                Navigator.pop(context);
              } else {
                setState(() {
                  widget.isProductAdd = true;
                });
                prodNameController.text = "";
                descController.text = "";
                categoryData = null;
                imageUrlOne = null;
                imageUrlTwo = null;
                imageUrlThree = null;
                imageUrlFour = null;
                imageUrlFive = null;
                imageUrlSix = null;
              }
            }
          } catch (ex) {
            print(ex);
            Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
          }
        } else {
          Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
        }
      });
    } else {
      Fluttertoast.showToast(msg: APPStrings.noInternetConnection);
    }
  }

  @override
  void dispose() {
    widget.isProductAdd = false;
    super.dispose();
  }

  callProductCategoryListApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      mHomeProvider!.getProductCategory().then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              productCategoryModel = ProductCategoryModel.fromJson(value);
            }
          } catch (ex) {
            print(ex);
            Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
          }
        } else {
          Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
        }
      });
    } else {
      Fluttertoast.showToast(msg: APPStrings.noInternetConnection);
    }
  }
}
