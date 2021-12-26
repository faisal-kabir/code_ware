
import 'dart:ffi';

import 'package:code_ware/Dimension/dimension.dart';
import 'package:code_ware/Theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:code_ware/URL/url.dart';
import 'package:get/get.dart';

import '../main.dart';
import 'dialog_button.dart';

class DefaultDialog extends StatefulWidget {
  Widget child;
  String title;
  bool isError;
  Alignment alignment;
  double? width;
  bool enableCloseButton;
  bool enableHeading;
  Function(bool)? onButtonClick;
  String? negativeButtonTitle;
  String? positiveButtonTitle;

  DefaultDialog({required this.child,required this.title,this.isError=false,this.alignment=Alignment.center,this.width,this.enableCloseButton=false,this.enableHeading=true,this.onButtonClick,this.negativeButtonTitle,this.positiveButtonTitle});
  @override
  _DefaultDialogState createState() => _DefaultDialogState(child: child,title: title,isError: isError);
}

class _DefaultDialogState extends State<DefaultDialog> {

  Widget child;
  String title;
  bool isError;
  double titleWidth=Get.width*0.2;

  _DefaultDialogState({required this.child,required this.title,this.isError=false});


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 300),
      child: Align(
        alignment: widget.alignment,
        child: Material(
          color: Colors.transparent,
          child: Card(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.all(0),
            elevation: 0,
            color: Themes.Primary,
            child: Container(
              width: widget.width ?? Get.width*0.9,
              color: Themes.White,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: ListView(
                shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    height: Dimension.Size_10,
                    color: Themes.Primary,
                    padding: EdgeInsets.zero,
                  ),
                  Visibility(
                    visible: widget.enableHeading,
                    child: Container(
                      padding: EdgeInsets.only(left: Dimension.Padding+Dimension.Size_10,right: Dimension.Padding+Dimension.Size_10,top: Dimension.Padding,bottom: Dimension.Padding),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(title,style: Theme.of(context).textTheme.headline1,),
                                Container(
                                  margin: EdgeInsets.only(top: Dimension.Size_5),
                                  height: Dimension.Size_5,
                                  width:titleWidth*0.75,
                                  decoration: BoxDecoration(
                                      color: Themes.Primary,
                                      borderRadius: BorderRadius.circular(Dimension.Size_5)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                              visible: widget.enableCloseButton,
                              child: GestureDetector(
                                onTap: ()=>Get.back(),
                                child: Container(
                                  height: Dimension.Size_30,
                                  width: Dimension.Size_30,
                                  decoration: BoxDecoration(
                                      color: Themes.White,
                                      borderRadius: BorderRadius.circular(Dimension.Size_8),
                                      border: Border.all(color: Themes.Grey,width: 1)
                                  ),
                                  child: Icon(Icons.close,color: Themes.Primary,size: Dimension.Size_14,),
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimension.Padding+Dimension.Size_10,right: Dimension.Padding+Dimension.Size_10),
                    child: child,
                  ),
                  Visibility(
                    visible: widget.onButtonClick!=null,
                    child: Container(
                      padding: EdgeInsets.all(Dimension.Padding).copyWith(bottom: 0,top: Dimension.Size_10),
                      child: DialogButton(
                        negativeButton: widget.negativeButtonTitle ?? language.No,
                        positiveButton: widget.positiveButtonTitle ?? language.Yes,
                        onTap: (state)=>widget.onButtonClick!(state)
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}