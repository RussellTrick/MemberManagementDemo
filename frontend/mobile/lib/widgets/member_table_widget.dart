import 'package:flutter/material.dart';
import 'package:mvc_php_demo/models/member.dart';

class MemberTableWidget extends StatelessWidget {
  final Future<List<Member>> members;

  MemberTableWidget(this.members);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Member>>(
      future: members,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Member> membersData = snapshot.data!;
          return membersData.isNotEmpty
              ? buildDataTable(membersData, context)
              : buildNoDataMessage();
        }
      },
    );
  }

  Widget buildDataTable(List<Member> membersData, context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Email')),
        DataColumn(label: Text('School')),
        DataColumn(label: Text('Actions')),
      ],
      rows: membersData.map<DataRow>((member) {
        return DataRow(
          cells: [
            DataCell(Text(member.name)),
            DataCell(Text(member.email)),
            DataCell(Text(member.schoolId.toString())),
            DataCell(Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle View button
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
                    // Handle Edit button
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
                    // Handle Delete button
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
