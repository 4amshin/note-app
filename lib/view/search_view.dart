import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Searching"),
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
}
