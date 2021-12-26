import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code_ware/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:code_ware/URL/api_client.dart';
import 'package:code_ware/URL/app_constant.dart';
import 'package:code_ware/URL/url.dart';
import 'package:code_ware/Widgets/show_message.dart';

part 'user_state.dart';

class UserBloc extends Cubit<UserState> {
  Map? user;
  Api_Client api_client=Api_Client();
  bool isUpdate=false;
  RxBool Loading=false.obs;

  TextEditingController name=TextEditingController();
  TextEditingController details=TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey();

  UserBloc() : super(UserInitial()) {
    var arguments = Get.arguments;
    if(arguments!=null){
      user=arguments;
      isUpdate=true;
      name.text='${user!['first_name']} ${user!['last_name']}';
    }
  }

  Future submitProduct() async {
    if(!formKey.currentState!.validate()){
      return;
    }
    Loading.value=true;
    emit(UserLoading());
    await api_client.Request(
        url: isUpdate ? '${URL.User}/${user!['id']}' : '${URL.User}',
        method: isUpdate ? Method.PUT : Method.POST,
        body: {
          AppConstant.name:name.text,
          AppConstant.job:details.text,
        },
        onSuccess: (Map data){
          SuccessMessage(message: language.Success,then: (){
            Get.back(result: true);
          });
        },
        onError: (data){
        }
    );
    Loading.value=false;
    emit(UserUploaded());
  }
}
