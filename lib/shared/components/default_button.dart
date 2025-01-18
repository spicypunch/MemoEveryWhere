import 'package:flutter/material.dart';

import '../ colors/default_colors.dart';

// GH에서 사용하는 기본버튼
class DefaultButton extends StatelessWidget {
  final String title; // 타이틀
  final VoidCallback? onTap; // tap 이벤트

  final Color foregroundColor; // 타이틀 색상
  final Color backgroundColor; // 배경 색상
  final Color disabledForegroundColor; // disabled 타이틀 색상
  final Color disabledBackgroundColor; // disabled 배경 색상

  final double fontSize; // 폰트사이즈
  final FontWeight fontWeight; // 폰트

  final double radius; // 곡률
  final double width; // 너비
  final double height; // 높이
  final bool isEnabled; // 버튼 활성화 여부

  const DefaultButton({
    required this.title,
    required this.onTap,
    this.foregroundColor = DefaultColors.white,
    this.backgroundColor = DefaultColors.modernBlue,
    this.disabledForegroundColor = DefaultColors.white,
    this.disabledBackgroundColor = DefaultColors.grey600,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.radius = 12,
    this.width = double.infinity,
    this.height = 56,
    this.isEnabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          disabledForegroundColor: disabledForegroundColor,
          disabledBackgroundColor: disabledBackgroundColor,
        ),
        onPressed: isEnabled ? onTap : null,
        child: Text(
          title,
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
