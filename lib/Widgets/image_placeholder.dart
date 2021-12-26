import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:code_ware/Theme/themes.dart';

Widget ImagePlaceHolder({required double height}){
  return Container(
    color: Themes.White,
    child: Image.asset('assets/empty.png',fit: BoxFit.cover,height: height,),
  );
}
Widget UserImagePlaceHolder({required double height}){
  return Container(
    color: Themes.White,
    child: SvgPicture.asset('assets/user.svg',height: height,width: height,),
  );
}