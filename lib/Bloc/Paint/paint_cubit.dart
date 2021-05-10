import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paint/Constants/app_constants.dart';
import 'package:paint/Model/paint_model.dart';
import 'paint_state.dart';

class PaintCubit extends Cubit<PaintModel> {
  PaintCubit() : super(PaintModel(AppConstant.colorList[0], 2, 1, []));

  void color(Color color) {
    emit(PaintModel(color, state.stroke, state.opacity, state.points));
  }

  void stroke(double stroke) {
    emit(PaintModel(state.color, stroke, state.opacity, state.points));
  }

  void opacity(double opacity) {
    emit(PaintModel(state.color, state.stroke, opacity, state.points));
  }

  void draw(Offset? offset) {
    if (offset == null) {
      state.points.add(null);
      return;
    }
    state.points.add(
      Point(
        offset,
        Paint()
          ..color = state.color.withOpacity(state.opacity)
          ..isAntiAlias = true
          ..strokeWidth = state.stroke
          ..strokeCap = StrokeCap.round,
      ),
    );
    emit(PaintModel(state.color, state.stroke, state.opacity, state.points));
  }

  void clear() {
    emit(PaintModel(state.color, state.stroke, state.opacity, []));
  }
}
