
import 'package:draggable/main.dart';
import 'package:draggable/views/widget/draggable_widget_screen.dart';
import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../utility/utils.dart';

class DraggableHardLevelScreen extends StatefulWidget {
  @override
  _DraggableHardLevelScreen createState() => _DraggableHardLevelScreen();
}

class _DraggableHardLevelScreen extends State<DraggableHardLevelScreen> {
  final List<Flower> all = allflowers;
  final List<Flower> land = [];
  final List<Flower> desert = [];

  final double size = 150;

  void removeAll(Flower toRemove) {
    all.removeWhere((flower) => flower.imageUrl == toRemove.imageUrl);
    land.removeWhere((flower) => flower.imageUrl == toRemove.imageUrl);
    desert.removeWhere((flower) => flower.imageUrl == toRemove.imageUrl);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            leading: InkWell(onTap: (){
              // Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => HomePage()));
          }, child: const Icon(Icons.arrow_back_ios_new_outlined),),
          title: const  Text(MyApp.title),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildTarget(
              context,
              text: 'All',
              flowers: all,
              acceptTypes: FlowerType.values,
              onAccept: (data) => setState(() {
                removeAll(data);
                all.add(data);
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildTarget(
                  context,
                  text: 'Flowers',
                  flowers: land,
                  acceptTypes: [FlowerType.land],
                  onAccept: (data) => setState(() {
                    removeAll(data);
                    land.add(data);
                  }),
                ),
                buildTarget(
                  context,
                  text: 'Deserts',
                  flowers: desert,
                  acceptTypes: [FlowerType.desert],
                  onAccept: (data) => setState(() {
                    removeAll(data);
                    desert.add(data);
                  }),
                ),
              ],
            ),
          ],
        ),
      );

  Widget buildTarget(
    BuildContext context, {
    required String text,
    required List<Flower> flowers,
    required List<FlowerType> acceptTypes,
    required DragTargetAccept<Flower> onAccept,
  }) =>
      CircleAvatar(
        radius: size / 2,
        child: DragTarget<Flower>(
          builder: (context, candidateData, rejectedData) => Stack(
            children: [
              ...flowers
                  .map((flowers) => DraggableWidgetScreen(flower: flowers,))
                  .toList(),
              IgnorePointer(child: Center(child: buildText(text))),
            ],
          ),
          onWillAccept: (data) => true,
          onAccept: (data) {
            if (acceptTypes.contains(data.type)) {
              Utils.showFlushBar(
                context,
                text: 'This Is Correct 🥳',
                color: Colors.green,
              );
            } else {
              Utils.showFlushBar(
                context,
                text: 'This Looks Wrong ',
                color: Colors.red,
              );
            }

            onAccept(data);
          },
        ),
      );

  Widget buildText(String text) => Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 12,
          )
        ]),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}