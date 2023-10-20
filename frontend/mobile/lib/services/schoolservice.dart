import 'dart:convert';

import 'base_client.dart';
import 'package:mvc_php_demo/models/school.dart';
import 'package:mvc_php_demo/models/member.dart';

class SchoolService {
  final BaseClient client = BaseClient();

  Future<List<School>> getAllSchools() async {
    final response = await client.get('/schools');

    List<dynamic> data = json.decode(response);
    List<School> schools =
        data.map((item) => School(id: item['id'], name: item['name'])).toList();
    return schools;
  }

  Future<School> getSchoolById(int id) async {
    final response = await client.get('/schools/$id');
    return School.fromJson(json.decode(response));
  }

  Future<dynamic> createSchool(Map<String, dynamic> data) async {
    return client.post('/schools', data);
  }

  Future<dynamic> updateSchool(int id, Map<String, dynamic> data) async {
    return client.put('/schools/$id', data);
  }

  Future<dynamic> deleteSchool(int id) async {
    final response = await client.delete('/schools/$id');
    return response;
  }

  Future<List<Member>> getMembersBySchool(int schoolId) async {
    final response = await client.get('/schools/$schoolId/members');

    List<dynamic> data = json.decode(response);
    List<Member> members = data.map((item) => Member.fromJson(item)).toList();
    return members;
  }
}
