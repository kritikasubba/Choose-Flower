import 'package:draggable/data/data.dart';

import 'package:draggable/views/widget/draggable_widget_screen.dart';
import 'package:flutter/material.dart';

class DraggableBaseScreen extends StatefulWidget {
  const DraggableBaseScreen({Key? key}) : super(key: key);

  @override
  State<DraggableBaseScreen> createState() => _DraggableBaseScreenState();
}

class _DraggableBaseScreenState extends State<DraggableBaseScreen> {
  final double height = 60;
  final List<Flower> all = allflowers;
  int score = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Choose Flower'),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(height),
            child: Container(
              alignment: Alignment.center,
              height: height,
              child: _buildScore(score),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              buildOrigin(),
              buildTarget(context , text: 'Flowers', acceptType: FlowerType.land),
            ],
          ),
        ),
      );

// Widget buildTargets(BuildContext context) {
//  return buildTarget(context, text: 'Flowers', acceptType: FlowerType.land);

// }

Widget buildTarget(
  BuildContext context , {
    required String text,
    required FlowerType acceptType

  }
) => 
CircleAvatar(
  radius: 80,
  child:   DragTarget<Flower>(builder: (context, candidateData, rejectedData) {
    
  
    return Center(
  
      child: Text(text, style: const TextStyle(color: Colors.white , fontSize: 24),),
      
  
    );
    
    
  
  },
  onWillAccept: (data)  => true,
  onAccept: (data) {
    if(data.type == acceptType) {
    
    }
  },
  ),
);

  Widget buildOrigin() {
    return Stack(
      alignment: Alignment.center,
      children: all
          .map((flower) => DraggableWidgetScreen(
                flower: flower,
              ))
          .toList(),
    );
  }
}

Widget _buildScore(int score) {
  const style =
      TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Score',
        style: style,
      ),
      SizedBox(
        width: 60,
        child: Text(
          '$score',
          textAlign: TextAlign.right,
          style: style,
        ),
      )
    ],
  );
}
