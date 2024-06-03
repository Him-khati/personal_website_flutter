import 'package:flutter/material.dart';

class MasterDetailData {
  String id;
  String title;
  Widget widget;

  MasterDetailData({
    required this.id,
    required this.title,
    required this.widget,
  });
}
