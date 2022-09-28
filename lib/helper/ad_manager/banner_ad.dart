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
    adsFunction();
    super.initState();
  }

  void adsFunction() async {
    _ad = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: "ca-app-pub-3481984670024764/2590757015",
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            BannerAds.isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
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
  }
}
