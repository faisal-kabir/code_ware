import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:code_ware/Bloc/user_bloc.dart';
import 'package:code_ware/Dimension/dimension.dart';
import 'package:code_ware/Packege/Loading_Button/loading_button.dart';
import 'package:code_ware/Route/route.dart';
import 'package:code_ware/Theme/themes.dart';
import 'package:code_ware/URL/app_constant.dart';
import 'package:code_ware/URL/url.dart';
import 'package:code_ware/Widgets/default_appbar.dart';
import 'package:code_ware/Widgets/default_textfield.dart';
import 'package:code_ware/Widgets/user_skeleton.dart';
import 'package:code_ware/Widgets/circular_progress.dart';
import 'package:code_ware/Widgets/default_dialog.dart';
import 'package:code_ware/Widgets/grid_animation.dart';
import 'package:code_ware/Widgets/image_placeholder.dart';
import 'package:code_ware/Widgets/list_animation.dart';
import 'package:code_ware/Widgets/swipe_refresh.dart';

import '../main.dart';


class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> with TickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: BlocBuilder<UserBloc,UserState>(
        builder: (context, state) {
          return Scaffold(
            appBar: DefaultAppbar(
              title: context.read<UserBloc>().isUpdate ? language.Update_User : language.Add_User,
            ),
            body: mainView(context),
          );
        }
      ),
    );
  }

  Widget mainView(BuildContext context) {
    return Form(
      key: context.read<UserBloc>().formKey,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: Dimension.Padding,right: Dimension.Padding),
        children: [
          SizedBox(height: Dimension.Padding,),
          DefaultTextField(
            controller: context.read<UserBloc>().name,
            label: language.Name
          ),
          SizedBox(height: Dimension.Padding,),
          DefaultTextField(
            controller: context.read<UserBloc>().details,
            label: language.Job,
            maxLine: 5
          ),
          SizedBox(height: Dimension.Padding,),
          Obx(() =>
              LoadingButton(
                isLoading: context.read<UserBloc>().Loading.value,
                onPressed: () => context.read<UserBloc>().submitProduct(),
                buttonDecoration: ButtonDecoration.Shadow,
                backgroundColor: Themes.Primary2,
                child: Container(
                    margin: EdgeInsets.only(top: Dimension.Size_10,
                        bottom: Dimension.Size_10),
                    alignment: Alignment.center,
                    width: Get.width * 0.7,
                    child: Text(language.Submit.toUpperCase(),
                      style: Get.textTheme.headline1!.copyWith(
                          color: Themes.White),
                    )
                ),
              )),
        ],
      ),
    );
  }

}
