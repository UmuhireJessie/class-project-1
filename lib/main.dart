import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Discussion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> _listViewData = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];

  final List<String> _gridViewData = [
    'https://via.placeholder.com/150?text=Item+1',
    'https://via.placeholder.com/150?text=Item+2',
    'https://via.placeholder.com/150?text=Item+3',
    'https://via.placeholder.com/150?text=Item+4',
    'https://via.placeholder.com/150?text=Item+5',
    'https://via.placeholder.com/150?text=Item+6',
    'https://via.placeholder.com/150?text=Item+7',
    'https://via.placeholder.com/150?text=Item+8',
    'https://via.placeholder.com/150?text=Item+9',
    'https://via.placeholder.com/150?text=Item+10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Activity'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'List View',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _listViewData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_listViewData[index]),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Grid View',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _gridViewData.length,
              itemBuilder: (context, index) {
                return Image.network(
                  _gridViewData[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
