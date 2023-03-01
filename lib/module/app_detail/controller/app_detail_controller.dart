import 'package:flutter/material.dart';
import '../view/app_detail_view.dart';

class AppDetailController extends State<AppDetailView> {
  static late AppDetailController instance;
  late AppDetailView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
