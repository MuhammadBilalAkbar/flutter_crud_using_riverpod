import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';

// If you want not to rebuild the entire stateless widget use Consumer only with stateless widget.
// If you want to rebuild the entire stateless widget use extend ConsumerWidget on the top.

class WithWidgetRef extends ConsumerWidget {
  const WithWidgetRef({Key? key}) : super(key: key);

  void onSubmit(WidgetRef ref, String value) =>
      // ref.read(nameStateProvider.notifier).update((state) => value);
      // final user = ref.read(userModelProvider.notifier).updateName(value);
      ref.read(userModelProvider.notifier).updateName(value);

  void onSubmitAge(WidgetRef ref, String value) =>
      ref.read(userModelProvider.notifier).updateAge(
            int.parse(value),
          );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
// WidgetRef is similar to provider ref. Widget ref allows you to communicate from
// widgets to other providers.
    final name = ref.watch(nameProvider);
// If we want to continuously keep listening so you get to know if there are any changes
// or not, use ref.watch(). Use ref.watch() inside of build function.
    final nameRead = ref.read(nameProvider);
// If we want to read the value of nameProvider just once then we use ref.read(); It is
// don't use ref.read() in build method. We use it outside of build method when we have
// a stateful widget. It is also used in lifecycle methods and in functions.
// final nameStateRead = ref.watch(nameStateProvider) !=null ? ref.watch(nameStateProvider) : '';
    final nameStateRead = ref.watch(nameStateProvider) ?? '';
// If any value/property of userModelProvider changes, build re runs the entire widget tree.
    final user = ref.watch(userModelProvider);
// If you want to build the entire widget tree when a specific property of userModelProvider changes.
    final userSelect = ref.watch(
      userModelProvider.select((value) => value.name),
    );
    return Scaffold(
      appBar: AppBar(
        // title: Text(nameStateRead),
        title: Text(user.name),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              onSubmitted: (value) => onSubmit(ref, value),
            ),
            TextField(
              onSubmitted: (value) => onSubmitAge(ref, value),
            ),
            Text(user.age.toString()),
          ],
        ),
      ),
    );
  }
}
