import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../colors/default_colors.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;

  final String? title; // AppBar 타이틀
  final Color titleColor; // AppBar 타이틀 color
  final double fontSize; // 타이틀 폰트 size
  final FontWeight fontWeight; // 타이틀 폰트 weight

  final Color backgroundColor; // View BackgroundColor
  final Color appBarBackgroundColor; // AppBar BackgroundColor

  const DefaultLayout({
    required this.child,
    this.title,
    this.titleColor = DefaultColors.black,
    this.fontSize = 24,
    this.fontWeight = FontWeight.w700,
    this.backgroundColor = DefaultColors.grey300,
    this.appBarBackgroundColor = DefaultColors.grey300,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: renderAppBar(context),
      body: child,
    );
  }

  AppBar? renderAppBar(BuildContext context) {
    if (title == null) return null;

    return AppBar(
      centerTitle: true,
      foregroundColor: titleColor,
      backgroundColor: appBarBackgroundColor,
      elevation: 0,
      title: Text(
        title!,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
      leading: context.canPop()
          ? IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(Icons.arrow_back_rounded, size: 24),
      )
          : null,
    );
  }
}
