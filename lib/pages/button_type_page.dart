import 'package:flutter/material.dart';

class ButtonTypePage extends StatelessWidget {
  const ButtonTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            ButtonTypeExample(isEnabled: true),
            ButtonTypeExample(isEnabled: false),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class ButtonTypeExample extends StatelessWidget {
  final bool isEnabled;
  const ButtonTypeExample({super.key, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    final void Function()? onPressed = isEnabled ? () {} : null;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //elevated button
          ElevatedButton(onPressed: onPressed, child: const Text('Elevated')),
          // filled button
          FilledButton(onPressed: onPressed, child: const Text('Filled')),
          // text
          TextButton(onPressed: onPressed, child: const Text('Text')),
          // outlined button
          OutlinedButton(onPressed: onPressed, child: const Text('Outlined')),
        ],
      ),
    );
  }
}
