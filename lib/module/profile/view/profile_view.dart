import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/core.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: const [],
      ),
      body: Center(
        child: SvgPicture.asset(
          'assets/images/no_data.svg',
          width: 200,
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
