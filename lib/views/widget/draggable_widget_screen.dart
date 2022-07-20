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
    );

  
    
  }
  Widget buildImage() {
    return Container(
      height: size,
      width: size,
      child: Image.asset(flower.imageUrl),
    );
  }
}