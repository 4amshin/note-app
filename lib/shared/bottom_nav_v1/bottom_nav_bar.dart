// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatelessWidget {
  final int? selectedIndex;
  final void Function(int)? onItemSelected;
  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
      // backgroundColor: Colors.black,
      selectedIndex: selectedIndex!,
      showElevation: true,
      onItemSelected: onItemSelected!,
      items: [
        FlashyTabBarItem(
          activeColor: Colors.black,
          icon: SvgPicture.asset(
            'assets/icons/add_outline.svg',
            height: selectedIndex == 0 ? 20 : 18,
            color: selectedIndex == 0 ? Colors.black : Colors.grey,
          ),
          title: const Text(
            "Home",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        FlashyTabBarItem(
          activeColor: Colors.black,
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
            height: selectedIndex == 1 ? 20 : 15,
            color: selectedIndex == 1 ? Colors.black : Colors.grey,
          ),
          title: const Text(
            "Search",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
