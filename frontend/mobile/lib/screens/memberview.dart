import 'package:flutter/material.dart';
import 'package:mvc_php_demo/models/member.dart';
import 'package:mvc_php_demo/models/school.dart';
import 'package:mvc_php_demo/services/memberservice.dart';
import 'package:mvc_php_demo/services/schoolservice.dart';

class MemberView extends StatelessWidget {
  final Member member;
  final SchoolService _schoolService = SchoolService();
  final MemberService _memberService = MemberService();

  MemberView({required this.member});

  @override
  Widget build(BuildContext context) {
    Future<void> deleteMember(int id) async {
      await _memberService.deleteMember(member.id);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Member deleted successfully')));
        Navigator.pop(context, true);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(member.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoLabel(label: 'Name:', value: member.name),
            InfoLabel(label: 'Email:', value: member.email),
            FutureBuilder<School>(
              future: _schoolService.getSchoolById(member.schoolId),
              builder: (BuildContext context, AsyncSnapshot<School> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return InfoLabel(
                      label: 'School:', value: snapshot.data!.name);
                }
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement edit functionality
                  },
                  child: Text('Edit'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    deleteMember(member.id);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoLabel extends StatelessWidget {
  final String label;
  final String value;

  InfoLabel({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
