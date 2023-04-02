import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/item_service.dart';

class EditItemScreen extends StatefulWidget {
  final String documentId;
  final TextEditingController _itemName = TextEditingController();
  final TextEditingController _itemDesc = TextEditingController();

  EditItemScreen(this.documentId, String itemName, String itemDesc) {
    _itemName.text = itemName;
    _itemDesc.text = itemDesc;
  }

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  final ItemService _itemService = ItemService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Item"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: widget._itemName,
              decoration: const InputDecoration(label: Text("Item name")),
            ),
            TextField(
              controller: widget._itemDesc,
              decoration:
                  const InputDecoration(label: Text("Item Description")),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
  onPressed: _editItem,
  icon: Icon(Icons.edit),
  label: Text('Edit'),
  style: ButtonStyle(
    minimumSize: MaterialStateProperty.all(
        Size(double.infinity, 30),
    ),
  ),
),
SizedBox(height: 20),
ElevatedButton.icon(
  onPressed: _deleteItem,
  icon: Icon(Icons.delete),
  label: Text('Delete'),
  style: ButtonStyle(
    minimumSize: MaterialStateProperty.all(
        Size(double.infinity, 30),
    ),
  ),
),


          ],
        ),
      ),
    );
  }

  void _editItem() {
    final String newName = widget._itemName.text;
    final String newDesc = widget._itemDesc.text;

    if (newName.isNotEmpty && newDesc.isNotEmpty) {
      _itemService.updateItem(widget.documentId, {
        'name': newName,
        'desc': newDesc,
      }).then((value) {
        Navigator.pop(context);
      }).catchError((error) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(error.toString()),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      });
    }
  }

  void _deleteItem() {
    _itemService.deleteItem(widget.documentId).then((value) {
      Navigator.pop(context);
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(error.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });
  }
}