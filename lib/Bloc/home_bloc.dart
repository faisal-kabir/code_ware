import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:code_ware/URL/api_client.dart';
import 'package:code_ware/URL/app_constant.dart';
import 'package:code_ware/URL/url.dart';
import 'package:code_ware/Widgets/show_message.dart';

import '../main.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  List users=[];
  RxBool Loading=false.obs;
  int pageIndex=1;
  String Link='${URL.User}?page=';
  bool isEnd=false;

  Api_Client api_client=Api_Client();
  RefreshController refreshController=RefreshController();
  ScrollController scrollController=ScrollController();

  HomeBloc() : super(HomeInitial()) {
    getAllProduct();
    scrollController.addListener(() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      if(!Loading.value && !isEnd){
        pageIndex++;
        refreshController.requestLoading();
        getAllProduct();
      }else{
        refreshController.loadNoData();
      }
    }
   });
  }

  Future getAllProduct() async {
    emit(UserLoading());
    await api_client.Request(
        url: '${Link}$pageIndex',
        onSuccess: (Map data){
          List dt = data[AppConstant.data] as List;
          if(dt.isNotEmpty) {
            users.addAll(dt);
          } else {
            isEnd=true;
          }
        },
        onError: (data){
        }
    );
    refreshController.refreshCompleted();
    emit(UserGet(users));
  }

  Future deleteProduct(String id) async {
    Loading(true);
    await api_client.Request(
        url: URL.User+'/$id',
        method: Method.PATCH,
        onSuccess: (Map data){
          SuccessMessage(message: language.Deleted_Successfully);
          refresh();
        },
        onError: (data){
        }
    );
    Loading(false);
  }

  refresh() {
    isEnd=false;
    users.clear();
    pageIndex=1;
    getAllProduct();
  }
}
