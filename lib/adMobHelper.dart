import 'package:firebase_admob/firebase_admob.dart';

class AdMobHelper {

  static const String testMobileId = 'Mobile_id';

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testMobileId != null? <String>[testMobileId]: null,
    nonPersonalizedAds: true,
    keywords: <String>['games', 'finance'],
  );
  
  static BannerAd _bannerAd;

  static BannerAd createBannerAd(){
    return BannerAd(adUnitId: BannerAd.testAdUnitId,size: AdSize.fullBanner ,targetingInfo: targetingInfo);
  }

  static void initStateAd(){
    FirebaseAdMob.instance.initialize(appId:  BannerAd.testAdUnitId);
    _bannerAd = createBannerAd()..load()..show(anchorType: AnchorType.bottom);
  }

  static void disposeMyAd(){
    _bannerAd?.dispose();
  }

}
