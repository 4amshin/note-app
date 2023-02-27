import 'package:flutter/material.dart';
import 'package:note_app/shared/theme/color_theme.dart';
import 'package:note_app/widget/dialog_button_row.dart';
import 'package:note_app/widget/hm_text_field.dart';

class HmInputDialog extends StatelessWidget {
  final String? title;
  final Color? backgroundColor;
  const HmInputDialog({
    Key? key,
    this.title,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      width: 270,
      margin: const EdgeInsets.symmetric(
        vertical: 198,
      ),
      child: AlertDialog(
        backgroundColor: backgroundColor ?? nOrange,
        title: Text(
          title ?? "Card Widget",
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        content: Column(
          children: const [
            HmTextField(
              height: 50,
              label: 'Label',
            ),
            SizedBox(height: 15),
            HmTextField(
              height: 100,
              label: 'Description',
            ),
          ],
        ),
        actions: const [
          DialogButtonRow(),
        ],
      ),
    );
  }
}
