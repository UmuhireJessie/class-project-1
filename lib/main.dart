import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Discussion',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 200),
        Center(
          child: Text(
            "Welcome to Contacts App",
            style: TextStyle(fontSize: 40, fontFamily: 'Bungee'),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 40),
        SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactListPage()));
            },
            child: Text(
              'Open Contacts List',
              style: TextStyle(fontSize: 14, color: Color(0xff000000)),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromRGBO(255, 115, 1, 0.938),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class Contact {
  final String name;
  final String phoneNumber;

  Contact({this.name = 'Jack', this.phoneNumber = '000-1234'});
}

List<Contact> _contacts = [
  Contact(name: 'John Doe', phoneNumber: '555-1234'),
  Contact(name: 'Ane Doe', phoneNumber: '555-5678'),
  Contact(name: 'Ben Smith', phoneNumber: '555-9176'),
  Contact(name: 'Cloe Sill', phoneNumber: '225-9876'),
  Contact(name: 'Dan Man', phoneNumber: '554-9076'),
  Contact(name: 'Billy Main', phoneNumber: '902-9076'),
  Contact(name: 'Lily Can', phoneNumber: '902-0920'),
  Contact(name: 'Fred Bits', phoneNumber: '092-0920'),
  Contact(name: 'Ray Bruin', phoneNumber: '092-9229'),
  Contact(name: 'Opa Nuin', phoneNumber: '029-9229'),
  Contact(name: 'Wilson Bay', phoneNumber: '112-9229'),
];

class ContactListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      _contacts[index].name.substring(0, 1).toUpperCase(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  title: Text(_contacts[index].name),
                  subtitle: Text(_contacts[index].phoneNumber),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.edit),
                            SizedBox(width: 8),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.delete),
                            SizedBox(width: 8),
                            Text('Delete'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onTap: () {},
                );
              },
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondScreenTable()));
              },
              child: Text(
                'Use Table view',
                style: TextStyle(fontSize: 14, color: Color(0xff000000)),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(255, 115, 1, 0.938),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class SecondScreenTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact Table'),
        ),
        body: Center(
          child: SingleChildScrollView(
              // scrollDirection: Axis.horizontal,
              child: Column(children: [
            SizedBox(height: 20),
            Text(
              "~~~ The Data in Table view ~~~",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 34, 33, 39),
                fontWeight: FontWeight.bold,
              ),
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Phone Number')),
                DataColumn(label: Text('Actions')),
              ],
              rows: _contacts
                  .map(
                    (contact) => DataRow(
                      cells: [
                        DataCell(Text(contact.name)),
                        DataCell(Text(contact.phoneNumber)),
                        DataCell(
                          PopupMenuButton(
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    Icon(Icons.edit),
                                    SizedBox(width: 8),
                                    Text('Edit'),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    Icon(Icons.delete),
                                    SizedBox(width: 8),
                                    Text('Delete'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 8),
          ])),
        ));
  }
}
