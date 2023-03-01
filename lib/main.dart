import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/shared/page_navigation.dart';
import 'package:note_app/shared/screen_size.dart';
import 'package:note_app/view/home_view.dart';
import 'package:note_app/view/input_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
        textTheme: GoogleFonts.senTextTheme(),
      ),
      home: const PageNavigation(),
    );
  }
}
