import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lam_quen_flutter/input_form_app/data/categories.dart';
import 'package:lam_quen_flutter/input_form_app/models/category.dart';
import 'package:lam_quen_flutter/input_form_app/models/grocery_item.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({super.key});

  @override
  State<NewItemScreen> createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  final _formKey = GlobalKey<FormState>();

  String _enteredName = '';
  int _enteredQuantity = 1;
  Category _selectedCategory = categories[Categories.vegetables]!;
  bool _isSending = false;
  String? _errorMessage;

  Future<void> _saveItem() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() {
      _isSending = true;
      _errorMessage = null;
    });

    final responseData = await _sendItemToServer();

    if (!mounted) return;

    if (responseData == null) {
      setState(() => _errorMessage = "Failed to add item. Please try again.");
      return;
    }

    Navigator.of(context).pop(
      GroceryItem(
        id: responseData["name"],
        name: _enteredName,
        quantity: _enteredQuantity,
        category: _selectedCategory,
      ),
    );
  }

  Future<Map<String, dynamic>?> _sendItemToServer() async {
    final url = Uri.https(
      "instagram-app-45400-default-rtdb.asia-southeast1.firebasedatabase.app",
      "shopping-list.json",
    );

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "name": _enteredName,
          "quantity": _enteredQuantity,
          "category": _selectedCategory.title
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (_) {}

    return null;
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _enteredQuantity = 1;
      _selectedCategory = categories[Categories.vegetables]!;
      _errorMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new item')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildNameField(),
              const SizedBox(height: 10),
              _buildQuantityAndCategory(),
              if (_errorMessage != null) ...[
                const SizedBox(height: 10),
                Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
              ],
              const SizedBox(height: 16),
              _buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      maxLength: 50,
      decoration: const InputDecoration(labelText: 'Name'),
      validator: (value) =>
          (value?.trim().isEmpty ?? true) || value!.length > 50
              ? 'Must be between 1 and 50 characters.'
              : null,
      onSaved: (value) => _enteredName = value!.trim(),
    );
  }

  Widget _buildQuantityAndCategory() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(child: _buildQuantityField()),
        const SizedBox(width: 8),
        Expanded(child: _buildCategoryDropdown()),
      ],
    );
  }

  Widget _buildQuantityField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Quantity'),
      keyboardType: TextInputType.number,
      initialValue: _enteredQuantity.toString(),
      validator: (value) {
        final parsedValue = int.tryParse(value ?? '');
        return (parsedValue == null || parsedValue <= 0)
            ? 'Must be a valid, positive number.'
            : null;
      },
      onSaved: (value) => _enteredQuantity = int.parse(value!),
    );
  }

  Widget _buildCategoryDropdown() {
    return DropdownButtonFormField<Category>(
      value: _selectedCategory,
      items: categories.entries.map((category) {
        return DropdownMenuItem(
          value: category.value,
          child: Row(
            children: [
              Container(width: 16, height: 16, color: category.value.color),
              const SizedBox(width: 6),
              Text(category.value.title),
            ],
          ),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) setState(() => _selectedCategory = value);
      },
      decoration: const InputDecoration(labelText: 'Category'),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: _isSending ? null : _resetForm,
          child: const Text('Reset'),
        ),
        ElevatedButton(
          onPressed: _isSending ? null : _saveItem,
          child: _isSending
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Add Item'),
        ),
      ],
    );
  }
}
