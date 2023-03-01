import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/core.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const HmAppBar(),
      ),
      body: RefreshIndicator(
        onRefresh: controller.doRefresh,
        color: Colors.indigo,
        child: controller.dbInstance != null
            ? FutureBuilder<List<NoteModel>>(
                future: controller.dbInstance!.displayDb(),
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
                        // vertical: 2,
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
                            onTap: () => controller.toUpdateView(data),
                            onDelete: () => controller.doDelete(data.id!),
                            title: data.title,
                            content: data.content,
                            time: data.createdAt,
                            color: data.color,
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
        onPressed: () => controller.toCreateView(),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
