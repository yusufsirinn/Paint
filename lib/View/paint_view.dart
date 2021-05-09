import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paint/Bloc/PaintSetting/paint_cubit.dart';
import 'package:paint/Bloc/PaintSetting/paint_state.dart';
import 'package:paint/Constants/app_constants.dart';
import 'package:paint/Painter/custom_painter.dart';
import 'package:paint/Widgets/selected_color.dart';

class PaintView extends StatefulWidget {
  @override
  _PaintViewState createState() => _PaintViewState();
}

class _PaintViewState extends State<PaintView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaintCubit, PaintModel>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: GestureDetector(
              onPanStart: (detail) {
                context.read<PaintCubit>().draw(detail.localPosition);
              },
              onPanUpdate: (detail) {
                context.read<PaintCubit>().draw(detail.localPosition);
              },
              onPanEnd: (detail) {
                context.read<PaintCubit>().draw(null);
              },
              child: CustomPaint(
                painter: DrawingPainter(state.points),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: Center(
                child: BlocBuilder<PaintCubit, PaintModel>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...List.generate(
                          AppConstant.colorList.length,
                          (index) => GestureDetector(
                            onTap: () =>
                                context.read<PaintCubit>().color(AppConstant.colorList[index]),
                            child: SelectedColor(
                                isSelected: index == AppConstant.colorList.indexOf(state.color),
                                color: AppConstant.colorList[index]),
                          ),
                        ),
                        Slider(
                          min: 0,
                          max: 40,
                          value: state.stroke,
                          onChanged: (value) {
                            context.read<PaintCubit>().stroke(value);
                          },
                        ),
                        ElevatedButton(onPressed: (){
                          context.read<PaintCubit>().clear();
                        }, child: Text("Clear"))
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
