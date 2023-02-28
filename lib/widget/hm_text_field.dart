import 'package:flutter/material.dart';

import '../shared/theme/color_theme.dart';

class HmTextField extends StatelessWidget {
  final TextEditingController? controller;
  final double? height;
  final String? label;
  const HmTextField({
    Key? key,
    this.height,
    this.label,
    this.controller,
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
        controller: controller,
        decoration: InputDecoration(
          hintText: label ?? 'Label',
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black54,
          ),
          border: InputBorder.none,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
