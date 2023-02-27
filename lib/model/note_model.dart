// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NoteModel {
  final String? title;
  final String? content;
  final String? createdAt;
  final String? updatedAt;
  final Color? backgroundColor;
  NoteModel({
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.backgroundColor,
  });
}
