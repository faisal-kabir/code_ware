import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:code_ware/Dimension/dimension.dart';
import 'package:code_ware/Theme/themes.dart';

import '../main.dart';

Widget DefaultTextField({required TextEditingController controller,FocusNode? focusNode,String? label,Color? backgroundColor,IconData? prefixIcon,Widget? suffixIcon,
  int maxLine=1,TextInputType textInputType=TextInputType.text,bool obscureText=false,String? hint,bool enable=true,GestureTapCallback? onTap,bool isRequired=false,bool borderEnable=false,
double? borderRadius,bool labelAsTitle=false,TextAlign textAlign=TextAlign.left,bool autofocus=false,EdgeInsets? contentPadding,Color? borderColor,bool enableValidation=true,List<TextInputFormatter>? inputFormatters,
  FormFieldValidator<String>? validator}){
  if(!enable) {
    borderColor=Themes.Grey;
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Visibility(
        visible: labelAsTitle,
        child: Text(label!=null ? '$label${isRequired ? '*' : ''}' : '',style: TextStyle(color: Themes.Text_Color,fontSize: Dimension.Text_Size,fontWeight: Dimension.textBold),)
      ),
      GestureDetector(
        onTap: onTap,
        child: AbsorbPointer(
          absorbing: onTap!=null,
          child: TextFormField(
            style: TextStyle(color: enable ? Themes.Text_Color : Themes.Grey,fontSize: Dimension.Text_Size,fontWeight: Dimension.textNormal),
            controller: controller,
            focusNode: focusNode,
            autocorrect: false,
            keyboardType: textInputType,
            cursorColor: Themes.Primary,
            autofocus: autofocus,
            maxLines: maxLine,
            enabled: enable,
            obscureText: obscureText,
            textAlign: textAlign,
            textInputAction: TextInputAction.done,
            inputFormatters: inputFormatters,
            /*
              textInputType: TextInputType.numberWithOptions(decimal: true,),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11)
              ],
            */
            validator: enableValidation ? validator ?? (String? value) {
              if (value== null || value.isEmpty) {
                if(focusNode!=null) {
                  focusNode.requestFocus();
                }
                return label!=null ? '$label${language.Required}' : language.Required.replaceAll(language.Required.split(' ')[1], '');
              } else {
                return null;
              }
            } : null,
            decoration: InputDecoration(
                filled: true,
                contentPadding: contentPadding ?? const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                fillColor: enable ? backgroundColor ?? Themes.TextFieldBackground : Colors.transparent,
                enabledBorder: borderEnable ? textFieldBorder(borderRadius: borderRadius ?? Dimension.Size_10,borderColor: borderColor) : roundedBorder(),
                focusedBorder: borderEnable ? textFieldBorder(borderRadius: borderRadius ?? Dimension.Size_10,borderColor: borderColor) : roundedBorder(),
                errorBorder: borderEnable ? textFieldBorder(isError: true,borderRadius: borderRadius ?? Dimension.Size_10,borderColor: borderColor) : roundedBorder(),
                disabledBorder:  borderEnable ? textFieldBorder(borderRadius: borderRadius ?? Dimension.Size_10,borderColor: borderColor) : roundedBorder(),
                border: borderEnable ? textFieldBorder(borderRadius: borderRadius ?? Dimension.Size_10,borderColor: borderColor) : roundedBorder(),
                labelText: labelAsTitle ? null : label!=null ? '$label${isRequired ? '*' : ''}' : null,
                labelStyle: TextStyle(color: Themes.Text_Color,fontSize: Dimension.Text_Size,fontWeight: Dimension.textNormal),
                prefixIcon: prefixIcon != null ? Icon(prefixIcon,color: Themes.Primary,) :  null,
                errorStyle: TextStyle(fontSize: Dimension.Text_Size_Small_Extra,color: Themes.Red),
                suffixIcon: suffixIcon,
                hintText: hint,
                hintStyle: TextStyle(color: Themes.Grey,fontSize: Dimension.Text_Size,fontWeight: Dimension.textNormal)
            ),
          ),
        ),
      ),
    ],
  );
}

textFieldBorder({bool isError=false,double? borderRadius,Color? borderColor}){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius??Dimension.Size_5),
    borderSide: BorderSide(width: 1,color: isError ? Themes.Red : borderColor ?? Themes.Primary),
  );
}

roundedBorder()=>UnderlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(Dimension.Size_10)
);