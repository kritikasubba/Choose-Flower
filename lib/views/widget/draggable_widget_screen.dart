import 'package:flutter/material.dart';

import '../../../data/data.dart';


class DraggableWidgetScreen extends StatelessWidget {
 final Flower flower;
  const DraggableWidgetScreen({Key? key ,
  required this.flower
  }) : super(key: key);

  static double size = 150;

  @override
  Widget build(BuildContext context) {
    return Draggable<Flower>(
      data: flower,
      feedback: buildImage(),
      child: buildImage() ,
      childWhenDragging: Container(height: size),
    );

  
    
  }
  Widget buildImage() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(32) ,
      color: Colors.red
      ),
      height: size,
      width: size,
      child: Image.asset(flower.imageUrl),
    );
  }
}