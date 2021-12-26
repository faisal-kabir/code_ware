import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:code_ware/AppHelper/app_theme.dart';
import 'package:code_ware/Controller/app_controller.dart';
import 'package:code_ware/Dimension/dimension.dart';
import 'package:code_ware/Screen/splash.dart';
import 'package:code_ware/Theme/themes.dart';
import 'package:code_ware/URL/app_constant.dart';
import 'package:code_ware/URL/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Language/app_localizations.dart';
import 'Language/language.dart';
import 'Packege/Loading_Button/loading_button.dart';
import 'Route/route.dart';
import 'Widgets/list_scroll_behavior.dart';


Language language = Language();
SharedPreferences? prefs;
double? paddingTop,appbarHeight,screenRatio;
bool enableReCallApi=true;



void main() async {
  initServices();
  WidgetsFlutterBinding.ensureInitialized();
  startApp();
}

void initServices(){
  Get.put(() => AppController(),permanent: true);
}


void startApp(){
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with AutomaticKeepAliveClientMixin{

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  AppController appController = Get.put(AppController());




  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }




  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
        init: AppController(),
        builder: (controller){
          return GetMaterialApp(
            title: AppConstant.AppName,
            debugShowCheckedModeBanner: false,
            locale: Locale(controller.appLocale.value),
            supportedLocales: LocaleHelper.getAllLocale(),
            builder: (context,child) {
              return ScrollConfiguration(
                behavior: ListScrollBehavior(),
                child: child!,
              );
            },
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate
            ],
            theme: AppTheme(),
            getPages: appRoutes(),
            initialRoute: SPLASH_SCREEN,
            //home: CustomPageViewScreen(),
          );
        }
    );
  }
}

bool get isEnglish=>Get.find<AppController>().mainLocale.value==AppLocale.EN;
void dPrint(var data){
  if (kDebugMode) {
    print(data);
  }
}


