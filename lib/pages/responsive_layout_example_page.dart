import 'package:flutter/material.dart';

class ResponsiveLayoutExamplePage extends StatelessWidget {
  const ResponsiveLayoutExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth <= 600) {
              return _MobileLayout();
            } else {
              return _DesktopLayout();
            }
          },
        ),
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.amber),
      child: const Text('We are on Mobile Screen'),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.deepPurple),
      child: const Text('We are on Desktop Screen'),
    );
  }
}
