import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class HmNoteItem extends StatelessWidget {
  final String? title;
  final String? content;
  final String? time;
  final String? color;
  final void Function()? onDelete;
  final void Function()? onTap;
  const HmNoteItem({
    Key? key,
    this.title,
    this.content,
    this.time,
    this.color,
    this.onTap,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100.0,
        width: 100,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          // horizontal: 2,
        ),
        decoration: BoxDecoration(
          // Color(int.parse(data.color!, radix: 16)
          color: Color(int.parse(color!, radix: 16)),
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 95,
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  title ?? "Title",
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onDelete,
                child: SvgPicture.asset(
                  'assets/icons/trash.svg',
                  height: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(bottom: 33, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    content ?? "Description",
                    style: const TextStyle(
                      height: 1.1,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  padding: const EdgeInsets.only(
                    bottom: 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black45,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: Text(
                      DateFormat('EEEE, HH:mm').format(DateTime.parse(time!)),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
