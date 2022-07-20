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
          child: buildOrigin(),
        ),
      );

  Widget buildOrigin() {
    return Stack(
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
