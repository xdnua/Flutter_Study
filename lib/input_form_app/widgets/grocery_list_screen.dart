import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lam_quen_flutter/input_form_app/data/categories.dart';
import 'package:lam_quen_flutter/input_form_app/models/grocery_item.dart';
import 'package:lam_quen_flutter/input_form_app/widgets/new_item_screen.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  List<GroceryItem> _items = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    final url = Uri.https(
      "instagram-app-45400-default-rtdb.asia-southeast1.firebasedatabase.app",
      "shopping-list.json",
    );

    try {
      final response = await http.get(url);
      if (response.statusCode >= 400) throw Exception("Failed to load items");
      if (response.body == "null") {
        setState(() {
          _items = [];
          _isLoading = false;
        });
        return;
      }

      final listData = json.decode(response.body) as Map<String, dynamic>;
      final loadedItems = listData.entries.map((item) {
        final category = categories.entries
            .firstWhere(
                (catItem) => catItem.value.title == item.value['category'])
            .value;

        return GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
        );
      }).toList();

      setState(() {
        _items = loadedItems;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = "An error occurred while loading data!";
        _isLoading = false;
      });
    }
  }

  Future<void> _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder: (ctx) => const NewItemScreen()),
    );

    if (newItem != null) {
      setState(() {
        _items.add(newItem);
      });
    }
  }

  Future<void> _removeItem(GroceryItem item) async {
    final url = Uri.https(
      "instagram-app-45400-default-rtdb.asia-southeast1.firebasedatabase.app",
      "shopping-list/${item.id}.json",
    );

    setState(() {
      _items.removeWhere((i) => i.id == item.id);
    });

    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      setState(() {
        _error = "Failed to delete item.";
        _items.add(item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : _items.isEmpty
                  ? const Center(child: Text('No items added yet.'))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      itemCount: _items.length,
                      itemBuilder: (ctx, index) {
                        final item = _items[index];

                        return Dismissible(
                          key: ValueKey(item.id),
                          onDismissed: (_) => _removeItem(item),
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          child: GroceryListItem(item: item),
                        );
                      },
                    ),
    );
  }
}

class GroceryListItem extends StatelessWidget {
  final GroceryItem item;

  const GroceryListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      leading: ColoredBox(
        color: item.category.color,
        child: const SizedBox(width: 24, height: 24),
      ),
      trailing: Text('${item.quantity}'),
    );
  }
}
