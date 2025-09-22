import 'package:flutter/material.dart';

class CounterNotifier extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() {
    ++_count;
    notifyListeners();
  }

  void decrement() {
    if (_count > 0) {
      _count--;
    }
    notifyListeners();
  }
}

class StateManageExamplePage extends StatefulWidget {
  const StateManageExamplePage({super.key});

  @override
  State<StateManageExamplePage> createState() => _StateManageExamplePageState();
}

class _StateManageExamplePageState extends State<StateManageExamplePage> {
  final CounterNotifier _counter = CounterNotifier();
  @override
  void dispose() {
    super.dispose();
    _counter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _counter.increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () => _counter.decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      body: Center(
        child: ListenableBuilder(
          listenable: _counter,
          builder: (context, child) => Text(
            'Count : ${_counter.count}',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}

class DummyTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const DummyTextField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(onChanged: (value) => onChanged(value));
  }
}
