import 'package:flutter/material.dart';

class ColorPoint extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorPoint({
    required this.color,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border:
            Border.all(color: isSelected ? Colors.orange : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: 10,
        backgroundColor: color,
      ),
    );
  }
}
