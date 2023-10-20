import 'package:flutter/material.dart';
import 'package:mvc_php_demo/models/school.dart';
import 'package:mvc_php_demo/services/schoolservice.dart';

class SchoolEdit extends StatefulWidget {
  final int schoolId;

  SchoolEdit({required this.schoolId});

  @override
  // ignore: library_private_types_in_public_api
  _SchoolEditState createState() => _SchoolEditState();
}

class _SchoolEditState extends State<SchoolEdit> {
  late TextEditingController nameController;
  late SchoolService _schoolService;
  late Future<School> _futureSchool;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    _schoolService = SchoolService();
    _futureSchool = _fetchSchool();
  }

  Future<void> _handleSaveChanges() async {
    String newName = nameController.text;

    Map<String, dynamic> updateData = {
      'name': newName,
    };

    await _schoolService.updateSchool(widget.schoolId, updateData);
    if (context.mounted) Navigator.pop(context, true);
  }

  Future<School> _fetchSchool() async {
    return await _schoolService.getSchoolById(widget.schoolId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<School>(
      future: _futureSchool,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          School school = snapshot.data!;
          nameController.text = school.name;

          return Scaffold(
            appBar: AppBar(title: Text(school.name)),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Edit School Information',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name:',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _handleSaveChanges();
                    },
                    child: Text('Save Changes'),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
