import 'package:flutter/material.dart';
import 'package:mvc_php_demo/models/school.dart';

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
              ? buildDataTable(schoolsData)
              : buildNoDataMessage();
        }
      },
    );
  }

  Widget buildDataTable(List<School> schoolsData) {
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
                    // Handle View button
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(141, 200, 14, 1),
                    ),
                  ),
                  child: Text(
                    'View',
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
