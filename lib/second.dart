import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_app/main.dart';

class Second extends ConsumerWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String test = ref.watch(heheNotifier);
    return Two(test: test);
  }
}

class Two extends ConsumerWidget {
  const Two({
    super.key,
    required this.test,
  });

  final String test;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 48, 131),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Text entered in previous screen',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              Text(
                test,
                style: const TextStyle(color: Colors.white, fontSize: 50),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.backspace_outlined),
      ),
    );
  }
}
