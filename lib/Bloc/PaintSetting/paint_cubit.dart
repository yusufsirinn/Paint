import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paint/Constants/app_constants.dart';
import 'package:paint/Model/paint_model.dart';
import 'paint_state.dart';

class PaintCubit extends Cubit<PaintModel> {
  PaintCubit() : super(PaintModel(AppConstant.colorList[0], 2, []));

  void color(Color color) {
    emit(PaintModel(color, state.stroke, state.points));
  }

  void stroke(double stroke) {
    emit(PaintModel(state.color, stroke, state.points));
  }

  void draw(Offset? offset) {
    if(offset == null){
      state.points.add(null);
    }
    state.points.add(Point(
      offset!,
      Paint()
        ..color = state.color
        ..isAntiAlias = true
        ..strokeWidth = state.stroke
        ..strokeCap = StrokeCap.round,
    ),);
   emit(PaintModel(state.color, state.stroke, state.points));
  }

  void clear(){
   emit(PaintModel(state.color, state.stroke, []));

  }
}
