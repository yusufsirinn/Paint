import 'package:flutter/material.dart';
import 'package:paint/Model/paint_model.dart';

class PaintModel {
  Color color;
  double stroke;
  double opacity;
  List<Point?> points;

  PaintModel(this.color, this.stroke, this.opacity, this.points);
}
