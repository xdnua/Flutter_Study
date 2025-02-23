import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/input_form_app/models/grocery_item.dart';
import 'package:lam_quen_flutter/input_form_app/widgets/new_item_screen.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  final List<GroceryItem> _groceryItems = [];

  Future<void> _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder: (ctx) => const NewItemScreen()),
    );

    if (newItem == null) return;

    setState(() => _groceryItems.add(newItem));
  }

  void _removeItem(GroceryItem item) {
    setState(() => _groceryItems.remove(item));
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
      body: _groceryItems.isEmpty
          ? const Center(child: Text('No items added yet.'))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: _groceryItems.length,
              itemBuilder: (ctx, index) {
                final item = _groceryItems[index];

                return Dismissible(
                  key: ValueKey(item.id),
                  onDismissed: (_) => _removeItem(item),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(item.name),
        leading: Container(
          width: 24,
          height: 24,
          color: item.category.color,
        ),
        trailing: Text(item.quantity.toString()),
      ),
    );
  }
}
