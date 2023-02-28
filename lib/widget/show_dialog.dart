import 'package:flutter/material.dart';
import 'package:note_app/widget/dialog_button_row.dart';
import 'package:note_app/widget/hm_text_field.dart';

import '../shared/theme/color_theme.dart';

class HmInputDialog extends StatefulWidget {
  final String? title;
  final Function(Color)? onColorSelected;
  final TextEditingController? labelController;
  final TextEditingController? descriptionController;
  final void Function()? onSave;
  const HmInputDialog({
    Key? key,
    this.title,
    this.onColorSelected,
    this.labelController,
    this.descriptionController,
    this.onSave,
  }) : super(key: key);

  @override
  State<HmInputDialog> createState() => _HmInputDialogState();
}

class _HmInputDialogState extends State<HmInputDialog> {
  Color? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      width: 270,
      margin: const EdgeInsets.symmetric(
        vertical: 175,
      ),
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          widget.title ?? "Card Widget",
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        content: Column(
          children: [
            HmTextField(
              height: 50,
              label: 'Label',
              controller: widget.labelController,
            ),
            const SizedBox(height: 15),
            HmTextField(
              height: 100,
              label: 'Description',
              controller: widget.descriptionController,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (final color in [nBlue, nOrange, nCyan, nPink, nPink2])
                  GestureDetector(
                    onTap: () {
                      if (widget.onColorSelected != null) {
                        widget.onColorSelected!(color);
                        _selectedColor = color;
                        setState(() {});
                      }
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: _selectedColor == color
                          ? const Icon(
                              Icons.check,
                              size: 15,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
              ],
            ),
          ],
        ),
        actions: [
          DialogButtonRow(
            onSave: widget.onSave,
          ),
        ],
      ),
    );
  }
}
