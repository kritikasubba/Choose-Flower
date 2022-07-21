import 'package:draggable/views/screens/draggable_hard_level_screen.dart';
import 'package:draggable/views/screens/draggable_easy_level_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'views/screens/draggable_text_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Choose Flowers';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.red,
        ),
        home: HomePage(),
      );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Container(
    decoration: const  BoxDecoration(
      image:DecorationImage(image:  AssetImage('assets/back.jpg' ,) , fit: BoxFit.cover)
    ),
        child : Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: const [
          DraggableTextPositioned(),
             SizedBox(height: 10,),
          Center(
            child: EasyPositioned(),
          ),
           SizedBox(height: 10,),
            HardPositioned(),
           
          ],
        )
        
        // buildPages(),
      
        // bottomNavigationBar: buildBottomBar(),
      );
}

class HardPositioned extends StatelessWidget {
  const HardPositioned({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right:  MediaQuery.of(context).size.width / 3.4, 
      bottom: MediaQuery.of(context).size.height / 2.8 ,
      child: Container(
        height: 50,
          width: 150,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            width: 2, 
            color: Colors.teal
          ),
         borderRadius: BorderRadius.circular(10)
        ),
        child: TextButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) =>  DraggableHardLevelScreen()));
        }, child: const Text('Hard Level')),
      ),
    );
  }
}

class EasyPositioned extends StatelessWidget {
  const EasyPositioned({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
        child: Container(
             height: 50,
            width: 150,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              width: 2, 
              color: Colors.teal
            ),
           borderRadius: BorderRadius.circular(10)
          ),
          child: TextButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) =>  const DraggableEasyLevelScreen()));
          }, child: const Text('Easy Level')),
        ),
      );
  }
}

class DraggableTextPositioned extends StatelessWidget {
  const DraggableTextPositioned({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
       right:  MediaQuery.of(context).size.width / 3.4, 
      top: MediaQuery.of(context).size.height / 2.8 ,

      // top: 10,
      child: Container(
        height: 50,
        width: 150,
        
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            width: 2, 
            color: Colors.teal
          ),
         borderRadius: BorderRadius.circular(10)
        ),
        child: TextButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) =>  DraggableTextScreen()));
        }, child: const Text('Draggable Text')),
      ),
    );
  }
}

//   Widget buildBottomBar() {
//     const style = TextStyle(color: Colors.black , fontWeight: FontWeight.bold);

//     return BottomNavigationBar(
//       backgroundColor: Theme.of(context).primaryColor,
//       selectedItemColor: Colors.white,
//       unselectedItemColor: Colors.teal,
//        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
//       selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
//       currentIndex: index,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Text('Draggable', style: style),
//           label: 'Text' ,
//         ),
//         BottomNavigationBarItem(
//           icon: Text('Draggable', style: style),
//           label: 'Easy Level',
//         ),
//         BottomNavigationBarItem(
//           icon: Text('Draggable', style: style),
//           label:'Hard Level',
//         ),
//       ],
//       onTap: (int index) => setState(() => this.index = index),
//     );
//   }

//   Widget buildPages() {
//     switch (index) {
//       case 0:
//         return DraggableTextScreen();
//       case 1:
//         return const DraggableEasyLevelScreen();
//       case 2:
//         return DraggableHardLevelScreen();

//       default:
//         return Container();
//     }
//   }
// }