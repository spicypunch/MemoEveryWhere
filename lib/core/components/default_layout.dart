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
  final bool showBackButton; // 뒤로가기 버튼 표시 여부
  final bool showFloatingActionButton; // 플로팅 버튼 표시 여부
  final VoidCallback? onFloatingActionButtonPressed; // 플로팅 버튼 콜백
  final Widget? floatingActionButtonChild; // 플로팅 버튼 커스텀 위젯
  final List<Widget>? actions;

  const DefaultLayout({
    required this.child,
    this.title,
    this.titleColor = DefaultColors.black,
    this.fontSize = 24,
    this.fontWeight = FontWeight.w700,
    this.backgroundColor = DefaultColors.grey300,
    this.appBarBackgroundColor = DefaultColors.grey300,
    this.showBackButton = false,
    this.showFloatingActionButton = false,
    this.onFloatingActionButtonPressed,
    this.floatingActionButtonChild,
    this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: renderAppBar(context),
      body: child,
      floatingActionButton:
          showFloatingActionButton ? renderFloatingActionButton() : null,
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
      leading: (showBackButton)
          ? IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back_rounded, size: 24),
            )
          : null,
      actions: actions,
    );
  }

  Widget? renderFloatingActionButton() {
    if (!showFloatingActionButton) return null;

    return FloatingActionButton(
      onPressed: onFloatingActionButtonPressed,
      backgroundColor: DefaultColors.modernBlue,
      child: floatingActionButtonChild ?? Icon(Icons.add),
    );
  }
}
