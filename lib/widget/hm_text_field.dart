import 'package:flutter/material.dart';

import '../shared/theme/color_theme.dart';

class HmTextField extends StatelessWidget {
  final double? height;
  final String? label;
  const HmTextField({
    Key? key,
    this.height,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: label ?? 'Label',
          hintStyle: TextStyle(
            fontSize: 15,
            color: nOrange.withOpacity(0.7),
          ),
          border: InputBorder.none,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
