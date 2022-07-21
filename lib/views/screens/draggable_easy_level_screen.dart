import 'package:draggable/data/data.dart';
import 'package:draggable/utility/utils.dart';

import 'package:draggable/views/widget/draggable_widget_screen.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class DraggableEasyLevelScreen extends StatefulWidget {
  const DraggableEasyLevelScreen({Key? key}) : super(key: key);

  @override
  State<DraggableEasyLevelScreen> createState() =>
      _DraggableEasyLevelScreenState();
}

class _DraggableEasyLevelScreenState extends State<DraggableEasyLevelScreen> {
  final double height = 60;
  final List<Flower> all = allflowers;
  int score = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            leading: InkWell(onTap: (){
                // Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => HomePage()));
          }, child: const Icon(Icons.arrow_back_ios_new_outlined),),
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildOrigin(),
              const SizedBox(width: 20,),
              buildTarget(context,
                  text: 'Flowers', acceptType: FlowerType.land),
            ],
          ),
        ),
      );

// Widget buildTargets(BuildContext context) {
//  return buildTarget(context, text: 'Flowers', acceptType: FlowerType.land);

// }

  Widget buildTarget(BuildContext context,
          {required String text, required FlowerType acceptType}) =>
      CircleAvatar(
        radius: 80,
        child: DragTarget<Flower>(
          builder: (context, candidateData, rejectedData) {
            return Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            );
          },
          onWillAccept: (data) => true,
          onAccept: (data) {
            if (data.type == acceptType) {
              Utils.showFlushBar(context,
                  text: 'This is correct 👌', color: Colors.red);
              setState(() {
                score += 50;
                all.removeWhere((flower) => flower.imageUrl == data.imageUrl);
              });
            } else {
              setState(() {
                score -= 20;
              });
              Utils.showFlushBar(context,
                  text: 'Try Again! 😜', color: Colors.green);
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
