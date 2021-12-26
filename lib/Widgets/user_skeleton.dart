import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_ware/Dimension/dimension.dart';
import 'package:code_ware/Theme/themes.dart';
import 'package:code_ware/Widgets/list_animation.dart';
import 'package:skeletons/skeletons.dart';

Widget UserSkeleton({int count = 10}){
  return ListView.builder(
    itemCount: count,
    shrinkWrap: true,
    itemBuilder: (context,index){
      return ListAnimation(
        index: index,
        child: SkeletonItem(
            child: Container(
              margin: EdgeInsets.all(Dimension.Size_10).copyWith(bottom: 0),
              padding: EdgeInsets.all(Dimension.Size_10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2,color: Themes.Grey)
              ),
              child: Row(
                children: [
                  Container(
                    width: Get.height*0.05,
                    height: Get.height*0.05,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Themes.White
                    ),
                    margin: EdgeInsets.only(right: Dimension.Size_10),
                  ),
                  Expanded(
                    child: SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          lines: 2,
                          spacing: 6,
                          lineStyle: SkeletonLineStyle(
                            randomLength: true,
                            height: 10,
                            borderRadius: BorderRadius.circular(8),
                            minLength: MediaQuery.of(context).size.width / 6,
                            maxLength: MediaQuery.of(context).size.width / 3,
                          )),
                    ),
                  ),
                  Icon(Icons.edit)
                ],
              ),
            )
        )
      );
    }
  );
}