import 'package:flutter/material.dart';

import 'show_dialog.dart';

class HmNoteItem extends StatelessWidget {
  final String? title;
  final String? content;
  final String? time;
  final Color? color;
  const HmNoteItem({
    Key? key,
    this.title,
    this.content,
    this.time,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const HmInputDialog(
              title: 'Edit Note',
            );
          },
        );
      },
      child: Container(
        height: 100.0,
        width: 100,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 2,
        ),
        decoration: BoxDecoration(
          color: color ?? Colors.grey,
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: ListTile(
          title: Text(
            title ?? "Title",
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(bottom: 33),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  content ?? "Description",
                  style: TextStyle(
                    height: 1.1,
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
                Container(
                  height: 25,
                  padding: const EdgeInsets.only(
                    bottom: 3,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white70,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: Text(
                      time ?? "Today, 4:30",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
