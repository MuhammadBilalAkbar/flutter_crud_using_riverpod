import 'package:flutter/material.dart';
import 'package:flutter_crud_using_riverpod/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WithStateful extends ConsumerStatefulWidget {
  const WithStateful({Key? key}) : super(key: key);

  @override
  ConsumerState<WithStateful> createState() => _WithStatefulState();
}

class _WithStatefulState extends ConsumerState<WithStateful> {
  late final String name;

  @override
  void initState() {
    name = ref.read(nameProvider);
// use ref.read() to create one time listening otherwise it will continuously listen to changes.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name stateful'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(name),
          ],
        ),
      ),
    );
  }
}
