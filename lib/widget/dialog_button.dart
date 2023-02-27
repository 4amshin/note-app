import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final Color? bgColor;
  final void Function()? onPressed;
  const DialogButton({
    Key? key,
    this.title,
    this.titleColor,
    this.bgColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          elevation: 0,
        ),
        child: Text(
          title ?? "Title",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: titleColor,
          ),
        ),
      ),
    );
  }
}
