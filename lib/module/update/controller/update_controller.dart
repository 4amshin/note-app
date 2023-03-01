import 'package:flutter/material.dart';
import '../../../database/db_helper.dart';
import '../view/update_view.dart';

class UpdateController extends State<UpdateView> {
  static late UpdateController instance;
  late UpdateView view;

  DatabaseHelper dbInstance = DatabaseHelper();

  TextEditingController labelController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Color? selectedColor;

  @override
  void initState() {
    instance = this;
    dbInstance.database();
    labelController.text = widget.noteModel!.title!;
    descriptionController.text = widget.noteModel!.content!;
    selectedColor = Color(int.parse(widget.noteModel!.color!, radix: 16));
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

  doUpdateData() async {
    String colorString =
        selectedColor != null ? selectedColor!.value.toRadixString(16) : '';
    await dbInstance.updateData(widget.noteModel!.id!, {
      'title': labelController.text,
      'content': descriptionController.text,
      'color': colorString,
      'updatedAt': DateTime.now().toString(),
    });

    Navigator.pop(context);
    setState(() {});
  }
}
