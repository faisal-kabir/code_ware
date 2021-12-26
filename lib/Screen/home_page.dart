import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:code_ware/Bloc/home_bloc.dart';
import 'package:code_ware/Dimension/dimension.dart';
import 'package:code_ware/Route/route.dart';
import 'package:code_ware/Theme/themes.dart';
import 'package:code_ware/URL/app_constant.dart';
import 'package:code_ware/URL/url.dart';
import 'package:code_ware/Widgets/dialog_button.dart';
import 'package:code_ware/Widgets/user_skeleton.dart';
import 'package:code_ware/Widgets/circular_progress.dart';
import 'package:code_ware/Widgets/default_dialog.dart';
import 'package:code_ware/Widgets/grid_animation.dart';
import 'package:code_ware/Widgets/image_placeholder.dart';
import 'package:code_ware/Widgets/list_animation.dart';
import 'package:code_ware/Widgets/swipe_refresh.dart';

import '../main.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc,HomeState>(
        builder: (context, state) {
          Widget responseWidget= Container();
          if(state is UserLoading && context.read<HomeBloc>().users.isEmpty){
            responseWidget = UserSkeleton();
          } else if (state is UserGet) {
            responseWidget = mainView(context);
          } else {
            responseWidget = mainView(context);
          }
          return Scaffold(
            appBar: AppBar(
              title: Image.asset('assets/banner.png',height: Dimension.Size_40,),
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: Themes.White,
            ),
            body: SwipeRefresh(
                controller: context.read<HomeBloc>().refreshController,
                scrollController: context.read<HomeBloc>().scrollController,
                enablePullUp: true,
                onRefresh: () => context.read<HomeBloc>().refresh(),
                children: [
                  responseWidget
                ]
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                changeData(context);
              },
              backgroundColor: Themes.Primary2,
              icon: Icon(Icons.add_circle),
              label: Text(language.Add_User,),
            ),
          );
        }
      ),
    );
  }

  Widget mainView(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: context.read<HomeBloc>().users.length,
      itemBuilder: (context,index){
        Map singleUser=context.read<HomeBloc>().users[index];
        return ListAnimation(
          index: index,
          child: Card(
            margin: EdgeInsets.all(Dimension.Size_10).copyWith(bottom: 0),
            elevation: 5,
            child: ListTile(
              onTap: (){
                changeData(context,data: singleUser);
              },
              leading: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: singleUser['avatar'],
                  height: Get.height * 0.05,
                  width: Get.height * 0.05,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      UserImagePlaceHolder(
                          height: Get.height * 0.05),
                  errorWidget: (context, url, error) =>
                      UserImagePlaceHolder(
                          height: Get.height * 0.05),
                ),
              ),
              title: Text('${singleUser['first_name']} ${singleUser['last_name']}'),
              subtitle: Text(singleUser['email']),
              trailing: SizedBox(
                width: Get.width*0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.edit),
                    IconButton(
                      onPressed: () => deleteProduct(context,singleUser),
                      icon: Icon(Icons.delete,color: Themes.Red,)
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void changeData(BuildContext context, {Map? data}) async {
    var backData = await Get.toNamed(ADD_USER,arguments: data);
    if(backData!=null && backData){
      context.read<HomeBloc>().refresh();
    }
  }

  void deleteProduct(BuildContext context, Map productData) {
    Get.dialog(
      DefaultDialog(
        title: language.Warning,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(language.Are_you_sure_to_delete_this_User,style: Get.textTheme.bodyText1,),
            DialogButton(
              negativeButton: language.No,
              positiveButton: language.Yes,
              onTap: (state){
                if(state){
                  context.read<HomeBloc>().deleteProduct(productData['id'].toString());
                }
                Get.back();
              }
            )
          ],
        ),
      )
    );
  }

}
