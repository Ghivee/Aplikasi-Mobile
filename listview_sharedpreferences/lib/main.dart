import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'item_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView & SharedPrefs',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ItemModel> _items = [];
  List<ItemModel> _filteredItems = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _filterItems(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredItems = List.from(_items);
      } else {
        _filteredItems = _items
            .where((item) =>
                item.name.toLowerCase().contains(query.toLowerCase()) ||
                item.description.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  // Metode untuk memuat data dari SharedPreferences
  void _loadItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? itemsJson = prefs.getString('items');
    if (itemsJson != null) {
      List<dynamic> jsonList = json.decode(itemsJson);
      setState(() {
        _items = jsonList.map((e) => ItemModel.fromMap(e)).toList();
        _filteredItems = List.from(_items);
      });
    } else {
      // Data dummy jika belum ada data
      setState(() {
        _items = [
          ItemModel(
            id: 1,
            name: 'Item 1',
            description: 'Deskripsi item pertama',
          ),
          ItemModel(id: 2, name: 'Item 2', description: 'Deskripsi item kedua'),
        ];
        _filteredItems = List.from(_items);
      });
    }
  }

  // Metode untuk menyimpan data ke SharedPreferences
  void _saveItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> jsonList = _items.map((e) => e.toMap()).toList();
    await prefs.setString('items', json.encode(jsonList));
  }

  // Metode untuk menambahkan item baru
  void _addItem() {
    int newId = _items.isEmpty ? 1 : _items.last.id + 1;
    setState(() {
      _items.add(
        ItemModel(
          id: newId,
          name: 'Item $newId',
          description: 'Deskripsi item baru',
        ),
      );
      _filterItems(_searchQuery);
    });
    _saveItems();
  }

  void _editItem(ItemModel item) {
    TextEditingController nameController =
        TextEditingController(text: item.name);
    TextEditingController descController =
        TextEditingController(text: item.description);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextField(
                controller: descController,
                decoration: InputDecoration(labelText: 'Deskripsi'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  item.name = nameController.text;
                  item.description = descController.text;
                  _filterItems(_searchQuery);
                });
                _saveItems();
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Item')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari item...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: _filterItems,
            ),
          ),
          Expanded(
            child: _buildListView(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: _filteredItems.length,
      itemBuilder: (context, index) {
        final item = _filteredItems[index];
        return ListTile(
          title: Text(item.name),
          subtitle: Text(item.description),
          leading: CircleAvatar(child: Text('${item.id}')),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _items.removeWhere((element) => element.id == item.id);
                _filterItems(_searchQuery);
              });
              _saveItems();
            },
          ),
          onTap: () => _editItem(item),
        );
      },
    );
  }
}
