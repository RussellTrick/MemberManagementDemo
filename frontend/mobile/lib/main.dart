import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVC php Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('MVC php Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Schools',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(Text('1')),
                        DataCell(Text('Item 1')),
                        DataCell(Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Handle View button
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(141, 200, 14, 1)),
                              ),
                              child: Text(
                                'View',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            ElevatedButton(
                              onPressed: () {
                                // Handle Edit button
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(240, 168, 17, 1)),
                              ),
                              child: Text(
                                'Edit',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            ElevatedButton(
                              onPressed: () {
                                // Handle Delete button
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(231, 3, 1, 1)),
                              ),
                              child: Text(
                                'Delete',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                    // Add more DataRow entries as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
