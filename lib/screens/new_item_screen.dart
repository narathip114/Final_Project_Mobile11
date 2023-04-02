import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab_firebas/services/item_service.dart';
import 'package:logger/logger.dart';

class NewItemScreen extends StatefulWidget {
  @override
  State<NewItemScreen> createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  final _itemName = TextEditingController();
  final _itemDesc = TextEditingController();

  final ItemService _itemService = ItemService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: const Text("New Item"),
  ),
  body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
  controller: _itemName,
  decoration: InputDecoration(
    label: Text("ชื่อนามสกุล"),
    suffixIcon: Icon(Icons.topic),
  ),
),
const SizedBox(
  height: 20,
),
          TextField(
  controller: _itemDesc,
  decoration: InputDecoration(
    label: Text("รหัสนักศึกษา"),
    suffixIcon: Icon(Icons.description),
  ),
),
const SizedBox(
  height: 20,
),
          ElevatedButton.icon(
  onPressed: _addItem,
  icon: Icon(Icons.add),
  label: Text('ADD'),
  style: ButtonStyle(
    minimumSize: MaterialStateProperty.all(
        Size(double.infinity, 30),
    ),
  ),
)
        ],
      ),
    ),
  ),
);

  }

  _addItem() {
    _itemService.addItem2Firebase(
        _itemName.text, {"name": _itemName.text, "desc": _itemDesc.text});
  }
}