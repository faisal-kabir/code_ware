import 'package:code_ware/URL/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

Widget GridAnimation({required int index,required Widget child,int column=2}){
  return AnimationConfiguration.staggeredGrid(
    position: index,
    duration: Duration(milliseconds: AppConstant.AnimationDelay),
    columnCount: column,
    child: ScaleAnimation(
      child: FadeInAnimation(
        child: child,
      ),
    ),
  );
}