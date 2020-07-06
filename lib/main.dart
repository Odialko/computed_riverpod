import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final firstNameProvider = StateProvider((ref) => 'Viktor');
final secondNameProvider = StateProvider((ref) => 'Melnyk');

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: Home(),
      ),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Computed')),
      body: Center(
        child: MyComputed(),
      ),
    );
  }
}

class MyComputed extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final initialiseUser = Computed((read) {
      final firstName = read(firstNameProvider).state;
      final secondName = read(secondNameProvider).state;

      return Text('$firstName ${secondName[0]}');
    });
    final init = useProvider(initialiseUser);
    return Text('$init');
  }
}