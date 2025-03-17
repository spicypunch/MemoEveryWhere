import 'package:flutter/material.dart';
import '../colors/default_colors.dart';

typedef OnChanged = void Function(String);

class DefaultTextField extends StatefulWidget {
  final double height;
  final double width;
  final String title;
  final double fontSize;
  final String label; // textField에 들어갈 안내 텍스트
  final Color filledColor; // textField 배경 색
  final double radius; // textField 곡률
  final TextEditingController? controller; // 입력된 텍스트를 제어 및 관리
  final TextInputType keyboardType; // 키보드 입력 타입
  final bool obscureText; // 입력된 텍스트 가리기, 비밀번호 입력 시 true
  final OnChanged? onChanged; // 입력된 텍스트가 수정될 때 호출되는 콜백
  final bool expands;

  const DefaultTextField({
    required this.label,
    this.controller,
    this.height = 60,
    this.width = double.infinity,
    this.title = '',
    this.fontSize = 16.0,
    this.filledColor = DefaultColors.white,
    this.radius = 12,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.expands = false,
    super.key,
  });

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return TextSelectionTheme(
      data: const TextSelectionThemeData(
        selectionHandleColor: DefaultColors.modernBlue,
        cursorColor: DefaultColors.black,
      ),
      child: SizedBox(
        width: widget.width,
        height: widget.expands ? null : widget.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.title.isNotEmpty)
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: DefaultColors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            if (widget.title.isNotEmpty)
              const SizedBox(
                height: 14.0,
              ),
            Expanded(
              child: TextField(
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                obscureText: widget.obscureText,
                onChanged: widget.onChanged,
                maxLines: widget.obscureText ? 1 : (widget.expands ? null : 1),
                expands: widget.obscureText ? false : widget.expands,
                textAlignVertical: TextAlignVertical.top,
                style: TextStyle(
                    fontSize: widget.fontSize, color: DefaultColors.black),
                decoration: InputDecoration(
                  labelText: widget.label,
                  labelStyle:
                      TextStyle(fontSize: widget.fontSize, color: Colors.black),
                  filled: true,
                  fillColor: widget.filledColor,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: DefaultColors.grey400,
                    ),
                    borderRadius: BorderRadius.circular(widget.radius),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: DefaultColors.grey400,
                    ),
                    borderRadius: BorderRadius.circular(widget.radius),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: DefaultColors.grey400,
                    ),
                    borderRadius: BorderRadius.circular(widget.radius),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
