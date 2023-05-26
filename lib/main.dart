import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:riverpod_test_app/second.dart";

part 'main.g.dart';

@riverpod
String helloWorld(ref) {
  return 'Text Entered: ';
}

// @riverpod
// String hehe(ref) {
//   return 'hehe';
// }

class Hehe extends Notifier<String> {
  @override
  String build() {
    return 'Hehe';
  }

  void change(vals) {
    state = vals;
  }
}

final heheNotifier = NotifierProvider<Hehe, String>(Hehe.new);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    final String value1 = ref.watch(heheNotifier);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: First(value: value, value1: value1),
    );
  }
}

class First extends ConsumerWidget {
  const First({
    super.key,
    required this.value,
    required this.value1,
  });

  final String value;
  final String value1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController mycontroller = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            ),
            Text(
              value1,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                  controller: mycontroller,
                  decoration: const InputDecoration(hintText: 'Enter')),
            ),
            ElevatedButton(
                onPressed: () {
                  ref
                      .watch(heheNotifier.notifier)
                      .change(mycontroller.text.toString());
                  mycontroller.text = ref.watch(heheNotifier);
                },
                child: const Text('Enter ->'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Second()));
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.arrow_right_rounded),
      ),
    );
  }
}
