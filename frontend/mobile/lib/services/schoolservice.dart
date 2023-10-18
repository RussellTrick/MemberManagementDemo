import 'dart:convert';

import 'base_client.dart';
import 'package:mvc_php_demo/models/school.dart';

class SchoolService {
  final BaseClient client = BaseClient();

  Future<List<School>> getAllSchools() async {
    final response = await client.get('/schools');

    List<dynamic> data = json.decode(response);
    List<School> schools =
        data.map((item) => School(id: item['id'], name: item['name'])).toList();
    return schools;
  }

  Future<dynamic> getSchoolById(int id) async {
    return client.get('/schools/$id');
  }

  Future<dynamic> createSchool(Map<String, dynamic> data) async {
    return client.post('/schools', data);
  }

  Future<dynamic> updateSchool(int id, Map<String, dynamic> data) async {
    return client.put('/schools/$id', data);
  }

  Future<dynamic> deleteSchool(int id) async {
    return client.delete('/schools/$id');
  }
}
