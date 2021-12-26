import 'package:flutter/material.dart';
import 'package:code_ware/Theme/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Widget SwipeRefresh({required RefreshController controller,required VoidCallback onRefresh,required List<Widget> children,bool enablePullUp=false,ScrollController? scrollController}){
  return SmartRefresher(
    child:ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: children,
    ),
    scrollController: scrollController,
    onRefresh: onRefresh,
    //header: AppConstant.swipeIndicator,
    header: WaterDropMaterialHeader(backgroundColor: Themes.Primary,),
    footer: ClassicFooter(
      textStyle: Get.textTheme.bodyText1!.copyWith(color: Themes.White),
    ),
    enablePullDown: true,
    primary: false,
    enablePullUp: enablePullUp,
    controller: controller,
  );
}
