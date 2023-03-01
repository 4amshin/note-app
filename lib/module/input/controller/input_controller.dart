import 'package:flutter/material.dart';
import '../../../database/db_helper.dart';
import '../view/input_view.dart';

class InputController extends State<InputView> {
  static late InputController instance;
  late InputView view;

  DatabaseHelper dbInstance = DatabaseHelper();

  TextEditingController labelController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Color? selectedColor;

  @override
  void initState() {
    instance = this;
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
  Widget build(BuildContext context) => widget.build(context, this);

  getColor(Color? color) {
    selectedColor = color;
    setState(() {});
  }

  doSaveData() async {
    String colorString =
        selectedColor != null ? selectedColor!.value.toRadixString(16) : '';
    await dbInstance.insertData({
      'title': labelController.text,
      'content': descriptionController.text,
      'color': colorString,
      'createdAt': DateTime.now().toString(),
      'updatedAt': DateTime.now().toString(),
    });
    Navigator.pop(context);
    setState(() {});
  }
}
