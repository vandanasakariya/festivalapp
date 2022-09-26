import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// DatabaseReference databaseReference = FirebaseDatabase.instance.ref('users');

class BannerAds extends StatefulWidget {
  static bool isLoaded = false;

  const BannerAds({Key? key}) : super(key: key);

  @override
  _BannerAdsState createState() => _BannerAdsState();
}

class _BannerAdsState extends State<BannerAds> {
  BannerAd? _ad;
  // String bannerAd = FirebaseRemoteConfigUtils.bannerAdId;

  @override
  void initState() {
    // clearBannerAdData();
    // CustomBanners();
    adsFunction();
    super.initState();
  }

  // clearBannerAdData() {
  //   setState(() {
  //     AdConstants.url = '';
  //     AdConstants.id = 0;
  //     AdConstants.redirectionLink = '';
  //   });

  void adsFunction() async {
    // final firebaseRef = FirebaseDatabase(databaseURL: "https://e-shrm-default-rtdb.firebaseio.com/").reference().child("banner_id");
    // DataSnapshot bannerId = await firebaseRef.get();
    //
    // log("banner-id----->${bannerId.value} \n ");
    // // log("banner-id----->${bannerAd} \n ");

    _ad = BannerAd(
      size: AdSize.fullBanner,
      // adUnitId: bannerId.value.toString(),
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            BannerAds.isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          log('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
      request: const AdRequest(),
    );
    _ad?.load();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _ad == null ? 0 : 60,
      alignment: Alignment.center,
      child: _ad == null
          ? const SizedBox()
          : AdWidget(
              ad: _ad!,
            ),
    );
//     return Container(
//       child: _ad == null
//           ? SpinKitSpinningLines(
//               color: AppColor.homeSubText,
//             )
//           : AdWidget(
//               ad: _ad!,
//             ),
// //       width: _ad?.size.width.toDouble(),
// //       height: _ad?.size.height.toDouble(),
//        height: _ad == null ? 0 : 60,
//       alignment: Alignment.center,
//     );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return (!ConstantsData.status)
//         ? bannerAds.isLoaded
//             ? Container(
//                 child: AdWidget(
//                   ad: _ad,
//                 ),
//                 width: _ad.size.width.toDouble(),
//                 height: _ad.size.height.toDouble(),
//                 alignment: Alignment.center,
//               )
//             : SizedBox()
//         : CustomBanners();
//   }
// }
// class CustomBanners extends StatefulWidget {
//   @override
//   _CustomBannersState createState() => _CustomBannersState();
// }
//
// class _CustomBannersState extends State<CustomBanners> {
//   final _getPropertiesController = GetPropertiesController();
//
//   CustomBannerModel getCustomBannerModel = CustomBannerModel();
//
//   Future getCustomBanners() async {
//     getCustomBannerModel = await _getPropertiesController.getCustomBanners();
//     setState(() {
//       ConstantsData.url = getCustomBannerModel.url ?? 'null';
//       ConstantsData.id = getCustomBannerModel.id ?? '9';
//       ConstantsData.redirectionLink =
//           getCustomBannerModel.redirectionLink ?? 'null';
//       ConstantsData.status = getCustomBannerModel.status ?? false;
//     });
//
//     return getCustomBannerModel;
//   }
//
//   @override
//   void initState() {
//     getCustomBannerModel = null;
//     getCustomBanners();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return (ConstantsData.url.isNotEmpty)
//         ? GestureDetector(
//             onTap: () async {
//               _getPropertiesController.getClickEvent(ConstantsData.id);
//               String url = ConstantsData.redirectionLink;
//               if (await canLaunch(url))
//                 await launch(url);
//               else
//                 // can't launch url, there is some error
//                 throw "Could not launch $url";
//             },
//             child: Stack(alignment: Alignment.topLeft, children: [
//               Container(
//                 color: Colors.black12,
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height / 13.0,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Image.network(
//                         ConstantsData.url,
//                         fit: BoxFit.fill,
//                         height: MediaQuery.of(context).size.height / 13.0,
//                         width: MediaQuery.of(context).size.width,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ]),
//           )
//         : SizedBox();
//   }
// }
///
// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:stock_info/ads/ad_constant.dart';
//
// class BannerAds extends StatefulWidget {
//   static bool isLoaded = false;
//
//   const BannerAds({Key? key}) : super(key: key);
//
//   @override
//   _BannerAdsState createState() => _BannerAdsState();
// }
//
// class _BannerAdsState extends State<BannerAds> {
//   BannerAd? _ad;
//
//   @override
//   void initState() {
//     super.initState();
//     clearBannerAdData();
//     // CustomBanners();
//     adsFunction();
//     _ad!.load();
//   }
//
//   clearBannerAdData() {
//     setState(() {
//       AdConstants.url = '';
//       AdConstants.id = 0;
//       AdConstants.redirectionLink = '';
//     });
//   }
//
//   void adsFunction() {
//     _ad = BannerAd(
//       size: AdSize.fullBanner,
//       adUnitId: AdConstants.bannerAdsId,
//       listener: BannerAdListener(
//         onAdLoaded: (Ad ad) {
//           setState(() {
//             BannerAds.isLoaded = true;
//           });
//         },
//         onAdFailedToLoad: (Ad ad, LoadAdError error) {
//           log('$BannerAd failedToLoad: $error');
//           ad.dispose();
//         },
//         onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
//         onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
//       ),
//       request: const AdRequest(),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BannerAds.isLoaded
//         ? Container(
//             child: AdWidget(
//               ad: _ad!,
//             ),
//             width: _ad!.size.width.toDouble(),
//             height: _ad!.size.height.toDouble(),
//             alignment: Alignment.center,
//           )
//         : const SizedBox();
//   }
// }
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return (!ConstantsData.status)
// //         ? bannerAds.isLoaded
// //             ? Container(
// //                 child: AdWidget(
// //                   ad: _ad,
// //                 ),
// //                 width: _ad.size.width.toDouble(),
// //                 height: _ad.size.height.toDouble(),
// //                 alignment: Alignment.center,
// //               )
// //             : SizedBox()
// //         : CustomBanners();
// //   }
// // }
//
// // class CustomBanners extends StatefulWidget {
// //   @override
// //   _CustomBannersState createState() => _CustomBannersState();
// // }
// //
// // class _CustomBannersState extends State<CustomBanners> {
// //   final _getPropertiesController = GetPropertiesController();
// //
// //   CustomBannerModel getCustomBannerModel = CustomBannerModel();
// //
// //   Future getCustomBanners() async {
// //     getCustomBannerModel = await _getPropertiesController.getCustomBanners();
// //     setState(() {
// //       ConstantsData.url = getCustomBannerModel.url ?? 'null';
// //       ConstantsData.id = getCustomBannerModel.id ?? '9';
// //       ConstantsData.redirectionLink =
// //           getCustomBannerModel.redirectionLink ?? 'null';
// //       ConstantsData.status = getCustomBannerModel.status ?? false;
// //     });
// //
// //     return getCustomBannerModel;
// //   }
// //
// //   @override
// //   void initState() {
// //     getCustomBannerModel = null;
// //     getCustomBanners();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return (ConstantsData.url.isNotEmpty)
// //         ? GestureDetector(
// //             onTap: () async {
// //               _getPropertiesController.getClickEvent(ConstantsData.id);
// //               String url = ConstantsData.redirectionLink;
// //               if (await canLaunch(url))
// //                 await launch(url);
// //               else
// //                 // can't launch url, there is some error
// //                 throw "Could not launch $url";
// //             },
// //             child: Stack(alignment: Alignment.topLeft, children: [
// //               Container(
// //                 color: Colors.black12,
// //                 width: MediaQuery.of(context).size.width,
// //                 height: MediaQuery.of(context).size.height / 13.0,
// //                 child: SingleChildScrollView(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Image.network(
// //                         ConstantsData.url,
// //                         fit: BoxFit.fill,
// //                         height: MediaQuery.of(context).size.height / 13.0,
// //                         width: MediaQuery.of(context).size.width,
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ]),
// //           )
// //         : SizedBox();
// //   }
// // }

///. banner ad. ///
// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// RxBool isBannerLoaded = false.obs;

// class BannerAdView extends StatefulWidget {
//   const BannerAdView({Key? key}) : super(key: key);

//   @override
//   State<BannerAdView> createState() => _BannerAdViewState();
// }

// class _BannerAdViewState extends State<BannerAdView> {
//   BannerAd? _anchoredBanner;
//   bool _loadingAnchoredBanner = false;
//   static const AdRequest request = AdRequest(
//     keywords: <String>['foo', 'bar'],
//     contentUrl: 'http://foo.com/bar.html',
//     nonPersonalizedAds: true,
//   );

//   // static final String appBannerId = FirebaseRemoteConfigUtils.appBannerId;
//   // static final String iosBannerId = FirebaseRemoteConfigUtils.iosBannerId;

//   @override
//   void dispose() {
//     _anchoredBanner?.dispose();
//     isBannerLoaded.value = false;
//     log("isBannerAdLoad--<${isBannerLoaded.value.toString()}");
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Builder(
//       builder: (BuildContext context) {
//         if (!_loadingAnchoredBanner) {
//           _loadingAnchoredBanner = true;
//           _createAnchoredBanner(context);
//         }
//         return Container(
//           height: _anchoredBanner == null ? 0 : 70,
//           alignment: Alignment.center,
//           child: _anchoredBanner == null
//               ? const SizedBox()
//               : AdWidget(
//                   ad: _anchoredBanner!,
//                 ),
//         );
//       },
//     );
//   }

//   Future<void> _createAnchoredBanner(BuildContext context) async {
//     final AnchoredAdaptiveBannerAdSize? size =
//         await AdSize.getAnchoredAdaptiveBannerAdSize(
//       Orientation.portrait,
//       MediaQuery.of(context).size.width.truncate(),
//     );

//     if (size == null) {
//       print('Unable to get height of anchored banner.');
//       return;
//     }

//     final BannerAd banner = BannerAd(
//       size: const AdSize(width: 320, height: 70),
//       // size: AdSize.fullBanner,
//       request: request,

//       // ///live
//       // adUnitId: Platform.isAndroid
//       //     ? ''
//       //     : '',

//       ///test
//       adUnitId: Platform.isAndroid
//           ? "ca-app-pub-3940256099942544/6300978111"
//           // : "ca-app-pub-3940256099942544/2934735716",
//           : "ca-app-pub-3197546275943457/1753312942",
//       listener: BannerAdListener(
//         onAdLoaded: (Ad ad) {
//           print('AdMob Banner Ad onAdLoaded:');
//           setState(() {
//             isBannerLoaded.value = true;
//             log("isBannerAdLoad===${isBannerLoaded.toString()}");
//             _anchoredBanner = ad as BannerAd?;
//           });
//         },
//         onAdFailedToLoad: (Ad ad, LoadAdError error) {
//           isBannerLoaded.value = false;
//           print('AdMob Banner Ad failedToLoad: $error');
//           ad.dispose();
//         },
//         onAdImpression: (Ad ad) {
//           print('AdMob Banner Ad onAdImpression:');
//         },
//         onAdOpened: (Ad ad) {
//           print('AdMob Banner Ad onAdImpression: $ad');
//         },
//         onAdClosed: (Ad ad) {
//           print('AdMob Banner Ad onAdClosed.');
//         },
//       ),
//     );
//     return banner.load();
//   }
// }

/// InterstitalAd. ad. ///

// import 'dart:developer';
// import 'dart:io';

// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class InterstitalAd {
//   static InterstitialAd? _interstitialAd;
//   static int maxFailedLoadAttempts = 3;
//   static int _numInterstitialLoadAttempts = 0;

//   // static final String appInterstitialId =
//   //     FirebaseRemoteConfigUtils.appInterstitialId;
//   // static final String iosInterstitialId =
//   //     FirebaseRemoteConfigUtils.iosInterstitialId;
//   static const AdRequest request = AdRequest(
//     keywords: <String>['foo', 'bar'],
//     contentUrl: 'http://foo.com/bar.html',
//     nonPersonalizedAds: true,
//   );

//   // @override
//   // void initState() {
//   //   createInterstitialAd();
//   //   super.initState();
//   // }
//   //
//   // @override
//   // void dispose() {
//   //   _interstitialAd?.dispose();
//   //   super.dispose();
//   // }

//   // @override
//   // InterstitialAd myInterstitial = InterstitialAd(
//   //   adUnitId: Platform.isAndroid
//   //       ? 'ca-app-pub-3940256099942544~3347511713'
//   //       : '', //and:ca-app-pub-3940256099942544/6300978111,
//   //   request: request,
//   //   listener: AdListener(
//   //     onAdLoaded: (Ad ad) {
//   //       print('${ad.runtimeType} loaded.');
//   //       _interstitialReady = true;
//   //     },
//   //     onAdFailedToLoad: (Ad ad, LoadAdError error) {
//   //       print('${ad.runtimeType} failed to load: $error.');
//   //       ad.dispose();
//   //       _interstitialAd = null;
//   //       createInterstitialAd();
//   //     },
//   //     onAdOpened: (Ad ad) => print('${ad.runtimeType} onAdOpened.'),
//   //     onAdClosed: (Ad ad) {
//   //       print('${ad.runtimeType} closed.');
//   //       ad.dispose();
//   //       createInterstitialAd();
//   //     },
//   //     onApplicationExit: (Ad ad) =>
//   //         print('${ad.runtimeType} onApplicationExit.'),
//   //   ),
//   // );

//   static Future<void> createInterstitialAd() async {
//     await InterstitialAd.load(
//       adUnitId: Platform.isAndroid
//           ? "ca-app-pub-3940256099942544/1033173712"
//           // : "ca-app-pub-3940256099942544/4411468910",
//           : "ca-app-pub-3197546275943457/7635360865",
//       //and:ca-app-pub-3940256099942544/6300978111
//       request: request,
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (InterstitialAd ad) {
//           log('$ad loaded');
//           _interstitialAd = ad;
//           _numInterstitialLoadAttempts = 0;
//           _interstitialAd!.setImmersiveMode(true);
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           log('InterstitialAd failed to load: $error.');
//           _numInterstitialLoadAttempts += 1;
//           _interstitialAd = null;
//           if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
//             createInterstitialAd();
//           }
//         },
//       ),
//     );
//   }

//   static void showInterstitialAd() {
//     if (_interstitialAd == null) {
//       log('Warning: attempt to show interstitial before loaded.');
//       return;
//     }
//     _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (InterstitialAd ad) {
//         log('ad onAdShowedFullScreenContent.');
//       },
//       onAdDismissedFullScreenContent: (InterstitialAd ad) {
//         log('$ad onAdDismissedFullScreenContent.');
//         ad.dispose();
//         createInterstitialAd();
//       },
//       onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//         log('$ad onAdFailedToShowFullScreenContent: $error');
//         ad.dispose();
//         createInterstitialAd();
//       },
//     );
//     _interstitialAd!.show();
//     _interstitialAd = null;
//   }
// }

/// AppOpenAdManager ad ///
// import 'dart:developer';
// import 'dart:io';

// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AppOpenAdManager {
//   static AppOpenAd? appOpenAd;
//   static bool isShowingAd = false;
//   static bool isLoaded = false;

//   // static final String appOpenId = FirebaseRemoteConfigUtils.appOpenId;
//   // static final String iosOpenId = FirebaseRemoteConfigUtils.iosOpenId;

//   static Future<void> loadAd() async {
//     AppOpenAd.load(
//       adUnitId: Platform.isAndroid
//           ? "ca-app-pub-3940256099942544/3419835294"
//           // : "ca-app-pub-3940256099942544/5662855259",
//           : "ca-app-pub-3197546275943457/7490786983",
//       orientation: AppOpenAd.orientationPortrait,
//       request: const AdRequest(),
//       adLoadCallback: AppOpenAdLoadCallback(
//         onAdLoaded: (ad) {
//           print("Open Ad Loaded........");
//           appOpenAd = ad;
//           isLoaded = true;
//         },
//         onAdFailedToLoad: (e) {
//           log("open ad Error--->${e.toString()}");
//           loadAd();
//         },
//       ),
//     );
//   }

//   // Whether an ad is available to be shown.
//   static bool get isAdAvailable {
//     return appOpenAd != null;
//   }

//   static void showOpenAdIfAvailable() {
//     log("Open add Called=============");
//     if (appOpenAd == null) {
//       log('Tried to show ad before available.');
//       loadAd();
//       return;
//     }
//     if (isShowingAd) {
//       log('Tried to show ad while already showing an ad.');
//       return;
//     }
//     appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (ad) {
//         isShowingAd = true;
//         appOpenAd = ad;
//         print('$ad onAdShowedFullScreenContent');
//       },
//       onAdFailedToShowFullScreenContent: (ad, error) {
//         print('$ad onAdFailedToShowFullScreenContent: $error');
//         isShowingAd = false;
//         ad.dispose();
//         appOpenAd = null;
//         loadAd();
//       },
//       onAdDismissedFullScreenContent: (ad) {
//         print('$ad onAdDismissedFullScreenContent');
//         isShowingAd = false;
//         ad.dispose();
//         appOpenAd = null;
//         loadAd();
//       },
//     );
//     appOpenAd!.show();
//     appOpenAd = null;
//   }
// }
