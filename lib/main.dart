import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

void main(){
    runApp(
       const ProviderScope(
        child:MyApp(),
       ),
    );
}


class MyApp extends StatelessWidget{
    const MyApp({super.key});

    @override
    Widget build(BuildContext context){
        return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: FruitGameWidget(),
        ); // Closes MaterialApp
    }
}
// --- FRUIT LOGIC WORKER ---
class FruitNotifier extends Notifier<String> {
  final List<String> _fruits = ["🍎 Apple", "🍌 Banana", "🍊 Orange", "🍉 Watermelon", "🍇 Grapes"];

  @override
  String build(){
    return "🍎 Apple";
  }

  void changeFruit(){
    final random = Random();
    int randomIndex = random.nextInt(_fruits.length);

    state = _fruits[randomIndex];
  }
}

final fruitProvider = NotifierProvider<FruitNotifier, String>(FruitNotifier.new);


class CounterNotifier extends Notifier<int>{
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}

final counterProvider = NotifierProvider<CounterNotifier, int>(CounterNotifier.new);

class FruitGameWidget extends ConsumerWidget {
  const FruitGameWidget({super.key});
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentFruit = ref.watch(fruitProvider);
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Burnout Tracker"),
        backgroundColor: const Color(0xFFD32F2F),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text(
               "Burnout Time:",
               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
             Text(
               currentFruit,
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                ref.read(fruitProvider.notifier).changeFruit();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                "Start",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD32F2F),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical:12),
              ),
              child: Text(
                "Count: $counter",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
