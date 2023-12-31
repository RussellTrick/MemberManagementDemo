import 'package:flutter/material.dart';
import 'package:mvc_php_demo/models/school.dart';
import 'package:mvc_php_demo/widgets/member_table_widget.dart';
import 'package:mvc_php_demo/services/schoolservice.dart';

class SchoolView extends StatelessWidget {
  final School school;
  final SchoolService _schoolService = SchoolService();

  SchoolView({required this.school});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(school.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Members',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: MemberTableWidget(
                  _schoolService.getMembersBySchool(school.id)),
            ),
          ],
        ),
      ),
    );
  }
}
