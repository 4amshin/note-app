// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NoteModel {
  final int? id;
  final String? title;
  final String? content;
  final String? createdAt;
  final String? updatedAt;
  final String? color;
  NoteModel({
    this.id,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.color,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json["id"],
      title: json["title"],
      content: json["content"],
      color: json["color"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }
}
