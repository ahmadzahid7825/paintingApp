import 'package:flutter/material.dart';
import 'package:flutter_painting_tools/flutter_painting_tools.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final PaintingBoardController controller;
  @override
  void initState() {
    controller = PaintingBoardController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 237, 222, 178),
          title: const Text(
            'Painting App',
            style: TextStyle(
                color: Color.fromARGB(255, 92, 55, 29),
                fontWeight: FontWeight.w900),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Draw Something!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 21, 21, 21),
                        width: 2)),
                width: 310,
                child: Center(
                  child: PaintingBoard(
                    controller: controller,
                    boardBackgroundColor:
                        const Color.fromARGB(255, 244, 237, 218),
                    boardHeight: 500,
                    boardWidth: 300,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(0),
              child: IconButton(
                onPressed: () => controller.deletePainting(),
                icon: const Icon(Icons.delete),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
