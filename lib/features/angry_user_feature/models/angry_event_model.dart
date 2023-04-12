import 'package:flutter/material.dart';

class AngryEventModel{
  final DragDownDetails details;
  late DateTime dateTime;
  AngryEventModel(this.details){
    dateTime = DateTime.now();
  }
}