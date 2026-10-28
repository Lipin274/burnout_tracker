import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // 1. Always import Riverpod
import 'dart:math';

void main() {
  runApp(
    // 2. Wrap your app so Riverpod can work globally
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FruitGameWidget(),
    );
  }
}

// --- STATE WORKERS (Outside the UI completely) ---

class FruitNotifier extends Notifier<String> {
  final List<String> _fruits = ["Work", "Time", "Space", "Gravity", "Entropy"];

  @override
  String build() {
    return "Work";
  }

  void changeFruit() {
    final random = Random();
    state = _fruits[random.nextInt(_fruits.length)];
  }
}

final fruitProvider = NotifierProvider<FruitNotifier, String>(FruitNotifier.new);

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}

final counterProvider = NotifierProvider<CounterNotifier, int>(CounterNotifier.new);

// --- SCREEN 1: YOUR MAIN GAME WIDGET ---
class FruitGameWidget extends ConsumerWidget { // 3. Changed to ConsumerWidget
  const FruitGameWidget({super.key});
 
  @override
  Widget build(BuildContext context, WidgetRef ref) { // 4. Added WidgetRef ref
    // 5. Watch the providers to automatically refresh the screen on change
    final currentFruit = ref.watch(fruitProvider);
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Burnout Tracker"),
        backgroundColor: const Color(0xFFD32F2F),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                // 6. Use ref.read().notifier to trigger functions
                ref.read(fruitProvider.notifier).changeFruit();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text("Start", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD32F2F)),
              child: Text("Count: $counter", style: const TextStyle(fontSize: 18, color: Colors.white)),
            ),

            const SizedBox(height: 30),

            // 7. Navigation button to prove Riverpod works globally!
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              child: const Text("Go to Next Screen ➡️", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

// --- SCREEN 2: A COMPLETELY SEPARATE PAGE ---
class SecondScreen extends ConsumerWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 8. Without passing any parameters, this screen pulls the global count value!
    final globalCount = ref.watch(counterProvider);
    final globalFruit = ref.watch(fruitProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Data read instantly from page one:", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text("Element : $globalFruit", style: const TextStyle(fontSize: 24)),
            Text("Score : $globalCount", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Go Back"),
            ),
            
          ],
        ),
      ),
    );
  }
}
