import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/ui/dashboard/model/NotificationData.dart'
    as notification;
import 'package:sb_portal/ui/dashboard/view/buyer/BuyerSideMenu.dart';
import 'package:sb_portal/ui/dashboard/view/widgets/SideMenu.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/preference_helper.dart';

import '../../../utils/app_string.dart';
import '../../auth/model/CommonModel.dart';
import '../model/NotificationData.dart';
import '../provider/HomeProvider.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  HomeProvider? mHomeProvider;
  NotificationData? notificationData;
  List<notification.Notification> notificationsList = [];

  @override
  void initState() {
    super.initState();
    callNotificationListApi(true);
  }

  @override
  Widget build(BuildContext context) {
    mHomeProvider = Provider.of<HomeProvider>(context);
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: mHomeProvider!.isRequestSend,
        child: Scaffold(
          drawer: PreferenceHelper.getBool(PreferenceHelper.IS_SELLER_SIGN_IN)
              ? SideMenu()
              : const BuyerSideMenu(),
          appBar: AppBar(
            toolbarHeight: 80,
            foregroundColor: Colors.black,
            leadingWidth: 70,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    APPImages.icSplashLogo,
                    height: 65,
                    width: 65,
                  ),
                  /*Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      color: Colors.black,
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),*/
                ],
              ),
            ),
            backgroundColor: AppColors.colorWhite,
            elevation: 0.0,
          ),
          body: notificationsList.isNotEmpty
              ? ListView.builder(
                  itemCount: notificationsList.length,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return _itemNotificationList(index);
                  },
                )
              : SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.notifications,
                        size: 80,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Notification data Empty!",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  _itemNotificationList(int index) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),

      child: ExpansionTile(
      
        onExpansionChanged: (bool isExpand) {
          if (isExpand) {
            /*setState(() {
              notificationsList[index].isRead == "0";
            });*/

            if (notificationsList[index].isRead == "0") {
              callReadNotificationApi(notificationsList[index].id!);
            }
          }
        },
        title: Container(
          
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            color: notificationsList[index].isRead == "1"
                ? AppColors.colorLightBlueGrey
                : AppColors.colorDarkBlueGrey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
           notificationsList[index].notificationTitle!,
            style: const TextStyle(
              color: AppColors.colorBlack,
              fontWeight: FontWeight.w500,
              fontFamily: "RobotRegular",
              fontSize: 15,
            ),
          ),
        ),
        trailing: const SizedBox(),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: notificationsList[index].isRead == "1"
                    ? AppColors.colorLightBlueGrey
                    : AppColors.colorDarkBlueGrey,
                borderRadius: BorderRadius.circular(8)),
            child: Text(
              notificationsList[index].notificationData!,
              style: const TextStyle(
                  color: AppColors.colorBlack,
                  fontWeight: FontWeight.w500,
                  fontFamily: "RobotRegular",
                  fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  callNotificationListApi(bool isRequestSend) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      mHomeProvider!.getNotification(isRequestSend).then((value) {
        if (value != null) {
          try {
            NotificationData streams = NotificationData.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message!);
            } else {
              notificationData = NotificationData.fromJson(value);
              notificationsList =
                  notificationData!.results!.notifications!.reversed.toList();
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

  callReadNotificationApi(int notificationId) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      mHomeProvider!.readNotification(notificationId).then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "success") {
              // Fluttertoast.showToast(msg: streams.message);
              // Navigator.pop(context);
              callNotificationListApi(false);
            } else {
              Fluttertoast.showToast(msg: streams.message!);
            }
          } catch (ex) {
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
