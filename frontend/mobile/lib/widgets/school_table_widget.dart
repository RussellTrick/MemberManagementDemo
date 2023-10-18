import 'package:flutter/material.dart';
import 'package:mvc_php_demo/models/school.dart';

class SchoolTableWidget extends StatelessWidget {
  final List<School> schools;

  SchoolTableWidget({required this.schools});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Actions')),
      ],
      rows: schools.map((school) {
        return DataRow(cells: [
          DataCell(Text(school.name)),
          DataCell(Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle View button
                },
                child: Text('View'),
              ),
              SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: () {
                  // Handle Edit button
                },
                child: Text('Edit'),
              ),
              SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: () {
                  // Handle Delete button
                },
                child: Text('Delete'),
              ),
            ],
          )),
        ]);
      }).toList(),
    );
  }
}
