import 'package:flutter/material.dart';
import 'package:note_app/widget/hm_app_bar.dart';
import 'package:note_app/widget/show_dialog.dart';

import '../shared/theme/color_theme.dart';
import '../widget/hm_add_button.dart';
import '../widget/hm_note_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController labelController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    labelController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Color selectedColor = nBlue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const HmAppBar(),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: GridView.builder(
          itemCount: 5,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            return HmNoteItem(
              title: labelController.text,
              content: descriptionController.text,
              color: selectedColor,
            );
          },
        ),
      ),
      floatingActionButton: HmAddButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return HmInputDialog(
                title: 'Add Note',
                labelController: labelController,
                descriptionController: descriptionController,
                onColorSelected: (Color color) {
                  selectedColor = color;
                  print(selectedColor.toString());
                },
                onSave: () {
                  //TODO: ON SAVE--> Input label, description, & color into database
                  print(labelController.text);
                  print(descriptionController.text);
                  print(selectedColor);
                  Navigator.pop(context);
                  setState(() {});
                },
              );
            },
          );
        },
      ),
    );
  }
}
