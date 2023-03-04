import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateProvider<int>(
  (ref) => 0,
);

// If you use StateNotifier, you have to use StateNotifierProvider.
// If you use StateProvider, you have to use Provider.
class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
}

final counterProvider = StateNotifierProvider(
  (ref) => Counter(),
);

class NumberNotifier extends StateNotifier<List<String>> {
  NumberNotifier() : super(['number 99', 'number 20']);

  void add(String number) {
    state = [...state, number];
    // Three dots mean add all the objects and add this new number also
  }

  void remove(String number) {
    state = [...state.where((element) => element != number)];
  }

  void update(String number, String updatedNumber) {
    final updatedList = <String>[];
    for (var i = 0; i < state.length; i++) {
      if (state[i] == number) {
        updatedList.add(updatedNumber);
      } else {
        updatedList.add(state[i]);
      }
    }
    state = updatedList;
  }
}

final numbersProvider = StateNotifierProvider<NumberNotifier, List<String>>(
  (ref) => NumberNotifier(),
);

class HomePage extends ConsumerWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(counterStateProvider);
    final numbers = ref.watch(numbersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: numbers
                .map((e) => GestureDetector(
                      onTap: () {
                        ref.watch(numbersProvider.notifier).remove(e);
                      },
                      onLongPress: () {
                        ref.watch(numbersProvider.notifier).update(
                              e,
                              '$e ${Random().nextInt(100)}',
                            );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(e),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => ref.read(counterStateProvider.state).state++,
        onPressed: () {
          ref
              .watch(numbersProvider.notifier)
              .add('number ${Random().nextInt(100)}');
        },
        tooltip: 'Add new number',
        child: const Icon(Icons.add),
      ),
    );
  }
}
