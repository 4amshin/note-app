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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            label ?? "Lable",
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: height ?? 50,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(),
          decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
