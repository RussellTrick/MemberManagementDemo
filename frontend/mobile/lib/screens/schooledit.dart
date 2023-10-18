import 'package:flutter/material.dart';
import 'package:mvc_php_demo/models/school.dart';
import 'package:mvc_php_demo/services/schoolservice.dart';

class SchoolEdit extends StatefulWidget {
  final School school;

  SchoolEdit({required this.school});

  @override
  _SchoolEditState createState() => _SchoolEditState();
}

class _SchoolEditState extends State<SchoolEdit> {
  late TextEditingController nameController;
  late SchoolService _schoolService;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.school.name);
    _schoolService = SchoolService();
  }

  Future<void> _handleSaveChanges() async {
    String newName = nameController.text;

    Map<String, dynamic> updateData = {
      'name': newName,
    };

    try {
      await _schoolService.updateSchool(widget.school.id, updateData);

      // Refresh the widget after update
      setState(() {});
    } catch (error) {
      // Handle errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.school.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Edit School Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
              onPressed: _handleSaveChanges,
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
