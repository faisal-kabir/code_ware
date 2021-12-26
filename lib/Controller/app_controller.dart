import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:code_ware/Language/app_localizations.dart';
import 'package:code_ware/URL/app_constant.dart';

import '../main.dart';

class AppController extends GetxController {
  RxString appLocale=AppConstant.Default_Language.obs;
  Rx<AppLocale> mainLocale=AppConstant.Default_Locale.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    init();
  }
  void init()async{
    await SharedPreferences.getInstance().then((pr) {
      prefs = pr;
    });
    if(prefs!.containsKey(AppConstant.Share_Language)){
      appLocale.value=prefs!.getString(AppConstant.Share_Language)!;
      mainLocale.value=LocaleHelper.getLocale(appLocale.value);
      if(mainLocale.value!=AppLocale.EN){
        changeLocale(key: appLocale.value);
      }
    }
  }

  void changeLanguage({required String key}){
    prefs!.setString(AppConstant.Share_Language, key);
    changeLocale(key: key);
  }

  void changeLocale({required String key}) async {
    appLocale=key.obs;
    mainLocale.value=LocaleHelper.getLocale(key);
    LocaleHelper.setLanguage(mainLocale.value);
    update();
  }
}