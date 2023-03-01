import 'package:flutter/material.dart';
import 'package:note_app/database/db_helper.dart';
import 'package:note_app/widget/hm_save_button.dart';

import '../shared/theme/color_theme.dart';
import '../widget/hm_text_field.dart';

class InputView extends StatefulWidget {
  const InputView({Key? key}) : super(key: key);

  @override
  State<InputView> createState() => _InputViewState();
}

class _InputViewState extends State<InputView> {
  DatabaseHelper dbInstance = DatabaseHelper();

  TextEditingController labelController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Color? _selectedColor;

  @override
  void initState() {
    dbInstance.database();
    super.initState();
  }

  @override
  void dispose() {
    labelController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        child: ListView(
          children: [
            const Text(
              "Write\nYour Note",
              style: TextStyle(
                height: 1,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            HmTextField(
              height: 50,
              label: 'Label',
              controller: labelController,
            ),
            const SizedBox(height: 15),
            HmTextField(
              height: 70,
              label: 'Description',
              controller: descriptionController,
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (final color in [nBlue, nOrange, nCyan, nPink, nPink2])
                  GestureDetector(
                    onTap: () {
                      _selectedColor = color;
                      setState(() {});
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color,
                      ),
                      child: _selectedColor == color
                          ? const Icon(
                              Icons.check,
                              size: 20,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 30.0),
            HmSaveButton(
              onPressed: () async {
                String colorString = _selectedColor != null
                    ? _selectedColor!.value.toRadixString(16)
                    : '';
                await dbInstance.insertData({
                  'title': labelController.text,
                  'content': descriptionController.text,
                  'color': colorString,
                  'createdAt': DateTime.now().toString(),
                  'updatedAt': DateTime.now().toString(),
                });
                Navigator.pop(context);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
