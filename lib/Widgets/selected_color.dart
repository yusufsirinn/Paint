import 'package:flutter/material.dart';

class SelectedColor extends StatelessWidget {
  final bool isSelected;
  final Color color;

  const SelectedColor({Key? key, required this.isSelected, required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: isSelected
            ? Border.all(
                color: Colors.black,
                width: 2,
              )
            : null,
      ),
    );
  }
}
