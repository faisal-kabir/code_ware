import 'package:get/get.dart';
import 'package:code_ware/Screen/add_user_page.dart';
import 'package:code_ware/Screen/home_page.dart';
import 'package:code_ware/Screen/splash.dart';


const String HOME = "/home";
const String DEMO = "/demo";
const String SPLASH_SCREEN = "/";
const String ADD_USER = "/add-user";


List<GetPage> appRoutes()=>[
  GetPage(name: SPLASH_SCREEN, page: () => Splash()),
  GetPage(name: HOME, page: () => HomePage()),
  GetPage(name: ADD_USER, page: () => AddUser()),
];
