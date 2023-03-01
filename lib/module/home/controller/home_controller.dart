import 'package:flutter/material.dart';
import 'package:note_app/module/input/view/input_view.dart';
import 'package:note_app/module/update/view/update_view.dart';
import '../../../database/db_helper.dart';
import '../../../model/note_model.dart';
import '../view/home_view.dart';

class HomeController extends State<HomeView> {
  static late HomeController instance;
  late HomeView view;

  DatabaseHelper? dbInstance;

  Future initDatabase() async {
    await dbInstance!.database();
    setState(() {});
  }

  @override
  void initState() {
    dbInstance = DatabaseHelper();
    initDatabase();
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  Future doRefresh() async {
    setState(() {});
  }

  Future delete(int id) async {
    await dbInstance!.deleteData(id);
    setState(() {});
  }

  toCreateView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InputView(),
      ),
    ).then((value) {
      setState(() {});
    });
  }

  toUpdateView(NoteModel? noteModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateView(noteModel: noteModel),
      ),
    ).then((value) {
      setState(() {});
    });
  }

  doDelete(int noteId) {
    delete(noteId);
  }
}
