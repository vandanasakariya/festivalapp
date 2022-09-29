import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:festivalapp/theam/app_string.dart';
import 'package:festivalapp/utils/navigation-utils/routes.dart';
import 'package:festivalapp/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../helper/ad_manager/ad_controller.dart';
import '../../../../utils/size_utils.dart';
import '../../festival_controller.dart';

class DownloadImage extends StatefulWidget {
  const DownloadImage({Key? key}) : super(key: key);

  @override
  _DownloadImageState createState() => _DownloadImageState();
}

class _DownloadImageState extends State<DownloadImage> {
  final AdController adController = Get.find();
  final FestivalController festivalController = Get.find()..imageShow();
  ScreenshotController screenshotController = ScreenshotController();
  bool isChange = false;
  Uint8List? capturedImage;
  var one = Get.arguments;
  File? file;
  var image;

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  /*_toastInfo(String info) {
    Fluttertoast.showToast(
      msg: info,
    );
    print("info${info}");
  }*/

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    print(info);
    //_toastInfo(info);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: AppText(
                    text: AppString.wooHoo,
                    fontSize: SizeUtils.fSize_19(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: AppText(
                  text: AppString.yourCardIsReady,
                  fontSize: SizeUtils.fSize_19(),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: SizeUtils.verticalBlockSize * 5,
              ),
              Container(
                height: SizeUtils.verticalBlockSize * 35,
                width: SizeUtils.horizontalBlockSize * 70,
                child: one["capture"] == null
                    ? SizedBox()
                    : Image.memory(
                        one["capture"],
                      ),
                decoration: BoxDecoration(
                    //color: Colors.grey.shade300,
                    ),
              ),
              SizedBox(
                height: SizeUtils.verticalBlockSize * 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeUtils.verticalBlockSize * 1,
                    horizontal: SizeUtils.horizontalBlockSize * 1),
                child: InkWell(
                  onTap: () async {
                    adController.createInterstitialAd();
                    final tt = DateTime.now();
                    /*String d = tt.day.toString();
                    String m = tt.month.toString();
                    String y = tt.year.toString();
                    String hh = tt.hour.toString();
                    String mm = tt.minute.toString();
                    String ss = tt.second.toString();*/

                    showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: AlertDialog(
                              title: AppText(
                                  text: AppString.imgDwlSuccess,
                                  fontSize: SizeUtils.fSize_13()),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, Routes.cardsPage);
                                  },
                                  child: AppText(
                                    text: AppString.ok,
                                    fontSize: SizeUtils.fSize_16(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                    final result = await ImageGallerySaver.saveImage(
                      Uint8List.fromList(one["capture"]),
                      quality: 60,
                      name: "festivalcard-" + tt.toString(),
                    );
                    image = result;
                    print("result---${result}");
                    print("image---$image");
                    // _toastInfo("$result");
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeUtils.verticalBlockSize * 1),
                    child: CircleAvatar(
                      radius: 29,
                      backgroundColor: Colors.grey.shade400,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
              AppText(
                text: AppString.download,
                fontSize: SizeUtils.fSize_19(),
              ),
              /* GestureDetector(
                onTap: () async {
                  // if (File(image).exists()) {}
                  print("----00000----$image-");
                  try {
                    await Share.shareFiles([image.toString()], text: "image");
                  } catch (e) {
                    print("error----$e");
                  }
                  print("----00000---1--");
                  setState(() {});
                  print("----000000---2--");
                  shareMethod();
                  // try {
                  //   await FlutterShare.shareFile(
                  //       filePath: image.toString(), title: "image");
                  // } catch (e) {
                  //   print("error----$e");
                  // }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeUtils.verticalBlockSize * 2),
                  child: CircleAvatar(
                    radius: 29,
                    backgroundColor: Colors.grey.shade400,
                    child: const Icon(
                      Icons.share,
                      color: Colors.black87,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    */ /*vertical: SizeUtils.verticalBlockSize * 1*/ /*),
                child: AppText(
                  text: AppString.share,
                  fontSize: SizeUtils.fSize_19(),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  /*Future<void> shareMethod() async {
    try {
      // RenderRepaintBoundary boundary =
      // previewContainer.currentContext.findRenderObject();
      // if (boundary.debugNeedsPaint) {
      //   Timer(Duration(seconds: 1), () => screenShotAndShare());
      //   return null;
      // }
      // ui.Image image = await boundary.toImage();
      final directory = (await getExternalStorageDirectory())?.path;
      print("directory-----$directory");
      // ByteData byteData =
      //     await image.toByteData(format: ui.ImageByteFormat.png);
      // print("bydata---$byteData");
      // Uint8List pngBytes = byteData.buffer.asUint8List();
      File imgFile = new File('$directory/screenshot.png');
      // imgFile.writeAsBytes(pngBytes);
      // print('Screenshot Path:' + imgFile.path);
      final RenderObject? box = context.findRenderObject();
      Share.shareFiles(['$directory/screenshot.png'],
          subject: 'Screenshot + Share',
          text: 'Hey, check it out the sharefiles repo!');
    } on PlatformException catch (e) {
      print("Exception while taking screenshot:" + e.toString());
    }
  }*/
}
