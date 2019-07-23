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
    return BannerAd(adUnitId: "ca-app-pub-6676530801589270/5476371629",size: AdSize.smartBanner ,targetingInfo: targetingInfo);
  }

  static void initStateAd(){
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-6676530801589270~3472013058");
    _bannerAd = createBannerAd()..load()..show(anchorType: AnchorType.bottom);
  }

  static void disposeMyAd(){
    _bannerAd?.dispose();
  }

}
