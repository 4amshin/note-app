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
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            return const HmNoteItem(
              title: 'Coffee',
              content: 'best to drink when tired and needs',
              color: nBlue,
            );
          },
        ),
      ),
      floatingActionButton: HmAddButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const HmInputDialog(
                title: 'Add Note',
              );
            },
          );
        },
      ),
    );
  }
}
