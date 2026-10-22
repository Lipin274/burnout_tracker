import 'package:flutter/material.dart';
import 'dart:math';

void main(){
    runApp(const MyApp());
}

class MyApp extends StatelessWidget{
    const MyApp({super.key});

    @override
    Widget build(BuildContext context){
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: FruitGameWidget(),
        ); // Closes MaterialApp
    }
}

class FruitGameWidget extends StatefulWidget {
  const FruitGameWidget({super.key});

  @override
  State<FruitGameWidget> createState() => _FruitGameWidgetState();
}

class _FruitGameWidgetState extends State<FruitGameWidget> {
  final List<String> _fruits = ["🍎 Apple", "🍌 Banana", "🍊 Orange", "🍉 Watermelon","🍇 Grapes"];

  String _currentFruit = "🍎 Apple";

  void _changeFruit(){
    final random = Random();
    int randomIndex = random.nextInt(_fruits.length);

    setState((){
      _currentFruit = _fruits[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fruit Game"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text(
               "The lucky Fruit is:",
               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
             Text(
              _currentFruit,
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _changeFruit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(
                "Change Fruit",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
