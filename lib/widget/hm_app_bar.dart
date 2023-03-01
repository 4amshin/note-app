import 'package:flutter/material.dart';
import 'package:note_app/view/app_detail_view.dart';

class HmAppBar extends StatelessWidget {
  const HmAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 250.0,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppDetailView(),
                    ),
                  );
                },
                child: const Text(
                  "My Note",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 35,
                width: 35,
                decoration: const BoxDecoration(
                  color: Colors.amberAccent,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/profile.png',
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
