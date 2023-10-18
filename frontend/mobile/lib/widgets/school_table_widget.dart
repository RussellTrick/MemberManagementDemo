import 'package:flutter/material.dart';
import 'package:mvc_php_demo/models/school.dart';
import 'package:mvc_php_demo/screens/schoolview.dart';
import 'package:mvc_php_demo/screens/schooledit.dart';
import 'package:mvc_php_demo/services/schoolservice.dart';
import 'package:mvc_php_demo/models/member.dart';

class SchoolTableWidget extends StatefulWidget {
  @override
  _SchoolTableWidgetState createState() => _SchoolTableWidgetState();
}

class _SchoolTableWidgetState extends State<SchoolTableWidget> {
  final SchoolService _schoolService = SchoolService();

  Future<List<School>> _fetchSchools() async {
    return await _schoolService.getAllSchools();
  }

  Future<List<Member>> _getMembersBySchool(int schoolId) async {
    return await _schoolService.getMembersBySchool(schoolId);
  }

  Future<void> _deleteSchool(int id) async {
    await _schoolService.deleteSchool(id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('School deleted successfully')),
    );
    setState(() {});
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SchoolEdit(school: school),
                      ),
                    );
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
                    _deleteSchool(school.id);
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<School>>(
      future: _fetchSchools(), // Fetch schools here
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
}
