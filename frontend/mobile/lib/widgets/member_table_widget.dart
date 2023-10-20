import 'package:flutter/material.dart';
import 'package:mvc_php_demo/models/member.dart';
import 'package:mvc_php_demo/screens/memberview.dart';
import 'package:mvc_php_demo/services/memberservice.dart';
import 'package:mvc_php_demo/services/schoolservice.dart';

class MemberTableWidget extends StatefulWidget {
  final int schoolId;

  MemberTableWidget(this.schoolId);

  @override
  // ignore: library_private_types_in_public_api
  _MemberTableWidgetState createState() => _MemberTableWidgetState();
}

class _MemberTableWidgetState extends State<MemberTableWidget> {
  final MemberService _memberService = MemberService();
  final SchoolService _schoolService = SchoolService();

  Future<List<Member>> _fetchMembers() async {
    return await _schoolService.getMembersBySchool(widget.schoolId);
  }

  Future<void> _deleteMember(int id) async {
    await _memberService.deleteMember(id);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('School deleted successfully')),
      );
    }
    setState(() {});
  }

  Future<void> _navigateToMemberView(Member member) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MemberView(member: member),
      ),
    );

    if (result == true) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Member>>(
      future: _fetchMembers(),
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
        DataColumn(label: Text('Actions')),
      ],
      rows: membersData.map<DataRow>((member) {
        return DataRow(
          cells: [
            DataCell(Text(member.name)),
            DataCell(Text(member.email)),
            DataCell(Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _navigateToMemberView(member);
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
                    _deleteMember(member.id);
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
