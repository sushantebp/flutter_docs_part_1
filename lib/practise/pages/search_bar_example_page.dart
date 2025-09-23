import 'package:flutter/material.dart';

class SearchBarExamplePage extends StatefulWidget {
  const SearchBarExamplePage({super.key});

  @override
  State<SearchBarExamplePage> createState() => _SearchBarExamplePageState();
}

class _SearchBarExamplePageState extends State<SearchBarExamplePage> {
  final List<String> _items = const <String>[
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grapes',
    'Honeydew',
    'Kiwi',
    'Lemon',
  ];

  List<String> _filterItems(String query) {
    // Create a RegExp from the user's query.
    // escape special characters (remove like $,^)
    // and what caseSenstive does any capitalization like ('aPPle','appLe','APPLE') does not matter,and match
    final RegExp queryExp = RegExp(RegExp.escape(query), caseSensitive: false);
    // since queryExp has case-insensitive ,'aPPle' or 'APPle' or any substring of this will try to match with item
    // queryExp will match item with list and provide in list ['Apple'] if present in list
    final values = _items.where((item) => queryExp.hasMatch(item)).toList();
    // Return the filtered list of matched items.
    return values;
  }

  final SearchController searchController = SearchController();

  bool isClosed = false;

  @override
  void initState() {
    searchController.addListener(() {
      setState(() {
        // When user types, open suggestion popup
        if (searchController.text.isNotEmpty && !searchController.isOpen) {
          searchController.openView();
          isClosed = true;
        } else if (searchController.text.isEmpty && searchController.isOpen) {
          searchController.closeView(null);
          isClosed = false;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Searching',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchAnchor(
              searchController: searchController,
              builder: (context, controller) {
                return SearchBar(
                  controller: controller,
                  leading: const Icon(Icons.search),
                  trailing: [
                    IconButton(
                      onPressed: () => searchController.clear(),
                      icon: isClosed
                          ? const Icon(Icons.close)
                          : const SizedBox.shrink(),
                    ),
                  ],
                );
              },
              suggestionsBuilder: (context, controller) {
                final query = controller.text;
                final filteredItems = _filterItems(query);

                return List<Widget>.generate(filteredItems.length, (index) {
                  final item = filteredItems[index];
                  return ListTile(
                    title: Text(
                      item,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onTap: () => controller.closeView(item),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
