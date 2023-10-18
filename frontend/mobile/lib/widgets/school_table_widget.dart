import 'package:flutter/material.dart';
import 'package:mvc_php_demo/models/school.dart';
import 'package:mvc_php_demo/screens/schoolview.dart';

class SchoolTableWidget extends StatelessWidget {
  final Future<List<School>> schools;

  SchoolTableWidget(this.schools);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<School>>(
      future: schools,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<School> schoolsData = snapshot.data!;
          return schoolsData.isNotEmpty
              ? buildDataTable(schoolsData, context)
              : buildNoDataMessage();
        }
      },
    );
  }

  Widget buildDataTable(List<School> schoolsData, context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Actions')),
      ],
      rows: schoolsData.map<DataRow>((school) {
        return DataRow(
          cells: [
            DataCell(Text(school.name)),
            DataCell(Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SchoolView(school: school),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.green,
                    ),
                  ),
                  child: Text(
                    'View',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle View button
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.yellow,
                    ),
                  ),
                  child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle View button
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.red,
                    ),
                  ),
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                // Add other buttons here
              ],
            )),
          ],
        );
      }).toList(),
    );
  }

  Widget buildNoDataMessage() {
    return Center(
      child: Text('No data available'),
    );
  }
}
