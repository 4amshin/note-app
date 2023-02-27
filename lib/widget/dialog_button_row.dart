import 'package:flutter/material.dart';

import '../shared/theme/color_theme.dart';
import 'dialog_button.dart';

class DialogButtonRow extends StatelessWidget {
  const DialogButtonRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
          },
          title: "Cancel",
          titleColor: Colors.white,
          bgColor: nOrange2,
        ),
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
          },
          title: "Save",
          titleColor: nOrange,
          bgColor: Colors.white,
        ),
      ],
    );
  }
}
