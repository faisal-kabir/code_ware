import 'dart:math';

import 'package:flutter/material.dart';
import 'package:code_ware/Dimension/dimension.dart';
import 'package:code_ware/Theme/themes.dart';

enum ButtonDecoration{Shadow,Flat}
class LoadingButton extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  final void Function() onPressed;
  final Color? backgroundColor;
  final BoxDecoration? decoration;
  final Widget? loadingWidget;
  final ButtonDecoration buttonDecoration;
  final double? radius;
  final paddingEnable;

  const LoadingButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.decoration,
    this.loadingWidget,
    this.radius,
    this.buttonDecoration=ButtonDecoration.Flat,
    this.paddingEnable=false
  }) : super(key: key);

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton>
    with TickerProviderStateMixin {
  /*AnimationController _animationController;
  Animation _animation;*/
  late BoxDecoration decoration;
  late Widget loadingWidget;
  double height=Dimension.Size_50,width=Dimension.Size_100;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*_animationController = AnimationController(vsync:this,duration: Duration(milliseconds: 800));
    _animationController.repeat(reverse: true);
    _animation =  Tween(begin: 0,end: 15.0).animate(_animationController)..addListener((){
      setState(() {

      });
    });*/
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //_animationController.dispose();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    buildDecoration();
    buildLoadingWidget();
  }

  void buildDecoration() {
    decoration = (widget.decoration !=null ? widget.decoration:
        widget.buttonDecoration == ButtonDecoration.Flat ? BoxDecoration(
          color: widget.backgroundColor ?? Themes.Primary,
          borderRadius: BorderRadius.circular(widget.radius ?? Dimension.Size_10),
        ):BoxDecoration(
          color: widget.backgroundColor ?? Themes.Primary,
          borderRadius: BorderRadius.circular(widget.radius ?? Dimension.Size_8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                blurRadius: Dimension.Size_16,
                offset: Offset(0, Dimension.Size_8), // changes position of shadow
              ),
            ],
        ))!;
  }

  void buildLoadingWidget() {
    loadingWidget = widget.loadingWidget ??
        SizedBox(
          width: 25,
          height: 25,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    buildDecoration();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: widget.isLoading ? null : widget.onPressed,
            child: AnimatedContainer(
              padding: widget.isLoading ? EdgeInsets.all(10) : widget.paddingEnable ? EdgeInsets.symmetric(horizontal: 10, vertical: 10) : EdgeInsets.zero,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              decoration: widget.isLoading ? decoration.copyWith(borderRadius: BorderRadius.circular(100)) : decoration,
              child: widget.isLoading ? loadingWidget : widget.child,
            ),
          ),
        ),
      ],
    );
  }
}


class SpriteDemo extends StatefulWidget {
  @override
  SpriteDemoState createState() =>  SpriteDemoState();
}

class SpriteDemoState extends State<SpriteDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync:this,duration: Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    _animation =  Tween(begin: 2.0,end: 15.0).animate(_animationController)..addListener((){
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 27, 28, 30),
          boxShadow: [BoxShadow(
              color: Color.fromARGB(130, 237, 125, 58),
              blurRadius: _animation.value,
              spreadRadius: _animation.value
          )]
      ),
      child: Icon(Icons.mic,color: Colors.white,),
    );
  }
}