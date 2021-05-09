import 'package:flutter/material.dart';
import 'package:paint/Model/paint_model.dart';

class PaintModel {
  Color color;
  double stroke;
  List<Point?> points;

  PaintModel(this.color, this.stroke ,this.points);
}