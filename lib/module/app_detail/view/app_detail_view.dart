import 'package:flutter/material.dart';
import 'package:note_app/core.dart';
import '../controller/app_detail_controller.dart';

class AppDetailView extends StatefulWidget {
  const AppDetailView({Key? key}) : super(key: key);

  Widget build(context, AppDetailController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("AppDetail"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<AppDetailView> createState() => AppDetailController();
}
