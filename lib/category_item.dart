import 'package:flutter/material.dart';

class CategroyItem extends StatelessWidget {

  final String title;
  final Color color;

  const CategroyItem(this.title, this.color, {super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: color,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.7),
          color,
          ],
          begin:Alignment.topLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(title),
    );
  }
}