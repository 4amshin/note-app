import 'package:flutter/material.dart';
import 'dialog_button.dart';

class DialogButtonRow extends StatelessWidget {
  final void Function()? onSave;
  const DialogButtonRow({
    Key? key,
    this.onSave,
  }) : super(key: key);

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
          titleColor: Colors.black,
          bgColor: Colors.white,
        ),
        DialogButton(
          onPressed: onSave,
          title: "Save",
          titleColor: Colors.white,
          bgColor: Colors.black,
        ),
      ],
    );
  }
}
