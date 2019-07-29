import 'package:firebase_admob/firebase_admob.dart';

class AdMobHelper {

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    nonPersonalizedAds: true,
    keywords: <String>['games', 'finance'],
    
  );
  
  static BannerAd _bannerAd;

  static BannerAd createBannerAd(){
    return BannerAd(adUnitId: BannerAd.testAdUnitId,size: AdSize.smartBanner ,targetingInfo: targetingInfo);
  }

  static void initStateAd(){
    FirebaseAdMob.instance.initialize(appId:FirebaseAdMob.testAppId);
    _bannerAd = createBannerAd()..load()..show(anchorType: AnchorType.bottom);
  }

  static void disposeMyAd(){
    _bannerAd?.dispose();
  }

}
