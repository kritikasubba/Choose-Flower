import 'package:draggable/main.dart';
import 'package:flutter/material.dart';

class DraggableTextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: InkWell(onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => HomePage()));
          }, child: const Icon(Icons.arrow_back_ios_new_outlined),),
          title: const Text('Draggable'),
          centerTitle: true,
        ),
        body: Center(
          child: Draggable(
            child: buildText('Pull Me', Colors.teal),
            feedback: Material(child: buildText('Dragged', Colors.purple)),
            childWhenDragging: buildText('Behind', Colors.black),
          ),
        ),
      );

  Widget buildText(String text, Color color) => Container(
        alignment: Alignment.center,
        width: 160,
        height: 100,
        color: color,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 32),
          textAlign: TextAlign.center,
        ),
      );
}
