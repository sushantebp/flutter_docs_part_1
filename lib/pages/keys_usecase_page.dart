import 'package:flutter/material.dart';

class KeysUsecasePage extends StatefulWidget {
  const KeysUsecasePage({super.key});

  @override
  State<KeysUsecasePage> createState() => _KeysUsecasePageState();
}

class _KeysUsecasePageState extends State<KeysUsecasePage> {
  final List<String> _items = ["Apple", "Banana", "Cherry"];
  final PageStorageBucket _bucket = PageStorageBucket();
  bool isToggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keys usecase in Flutter')),
      body: Column(
        children: <Widget>[
          // on toggling using new keys widget are emits
          IconButton(
            onPressed: () => setState(() => isToggle = !isToggle),
            icon: Icon(isToggle ? Icons.toggle_off : Icons.toggle_on),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: PageStorage(
              bucket: _bucket,
              child: ListView.builder(
                // local kyes use for page storage to defgine those itesm
                key: const PageStorageKey("fruitsListView"),
                itemCount: _items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = _items[index];
                  return ListTile(
                    // this use of key
                    key: ObjectKey(item),
                    title: Text(
                      item,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: isToggle
                ? UniqueKeyWidget(key: UniqueKey())
                : UniqueKeyWidget(key: UniqueKey()),
          ),
        ],
      ),
    );
  }
}

class UniqueKeyWidget extends StatefulWidget {
  const UniqueKeyWidget({super.key});

  @override
  State<UniqueKeyWidget> createState() => _UniqueKeyWidgetState();
}

class _UniqueKeyWidgetState extends State<UniqueKeyWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count : $_count'),
        ElevatedButton(
          onPressed: () => setState(() => ++_count),
          child: const Text('Increment'),
        ),
        const Text('This will change new key for widget'),
      ],
    );
  }
}
