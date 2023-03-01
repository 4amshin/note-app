import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:note_app/database/db_helper.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/view/input_view.dart';
import 'package:note_app/view/update_view.dart';
import 'package:note_app/widget/hm_app_bar.dart';
import 'package:intl/intl.dart';

import '../widget/hm_add_button.dart';
import '../widget/hm_note_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DatabaseHelper? dbInstance;

  Future doRefresh() async {
    setState(() {});
  }

  Future initDatabase() async {
    await dbInstance!.database();
    setState(() {});
  }

  Future delete(int id) async {
    await dbInstance!.deleteData(id);
    setState(() {});
  }

  @override
  void initState() {
    dbInstance = DatabaseHelper();
    initDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const HmAppBar(),
      ),
      body: RefreshIndicator(
        onRefresh: doRefresh,
        color: Colors.indigo,
        child: dbInstance != null
            ? FutureBuilder<List<NoteModel>>(
                future: dbInstance!.displayDb(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return Center(
                        child: SvgPicture.asset(
                          'assets/images/no_data.svg',
                          width: 200,
                        ),
                      );
                    }
                    return SafeArea(
                      minimum: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: GridView.builder(
                        itemCount: snapshot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemBuilder: (context, index) {
                          final data = snapshot.data![index];

                          return HmNoteItem(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      UpdateView(noteModel: data),
                                ),
                              ).then((value) {
                                setState(() {});
                              });
                            },
                            onDelete: () {
                              delete(data.id!);
                            },
                            title: data.title,
                            content: data.content,
                            time: DateFormat('EEEE, HH:mm')
                                .format(DateTime.parse(data.createdAt!)),
                            color: Color(int.parse(data.color!, radix: 16)),
                            // time: data.createdAt,
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: LoadingAnimationWidget.inkDrop(
                        color: Colors.indigo,
                        size: 35,
                      ),
                    );
                  }
                },
              )
            : Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: Colors.indigo,
                  size: 35,
                ),
              ),
      ),
      floatingActionButton: HmAddButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InputView(),
            ),
          ).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
