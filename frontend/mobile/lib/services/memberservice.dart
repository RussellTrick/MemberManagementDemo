import 'dart:convert';
import 'base_client.dart';
import 'package:mvc_php_demo/models/member.dart';

class MemberService {
  final BaseClient client = BaseClient();

  Future<List<Member>> getAllMembers() async {
    final response = await client.get('/members');

    List<dynamic> data = json.decode(response);
    List<Member> members = data
        .map((item) => Member(
            id: item['id'],
            name: item['name'],
            email: item['email'],
            schoolId: item['school_id']))
        .toList();
    return members;
  }

  Future<dynamic> getMemberById(int id) async {
    return client.get('/members/$id');
  }

  Future<dynamic> createMember(Map<String, dynamic> data) async {
    return client.post('/members', data);
  }

  Future<dynamic> updateMember(int id, Map<String, dynamic> data) async {
    return client.put('/members/$id', data);
  }

  Future<dynamic> deleteMember(int id) async {
    final response = await client.delete('/members/$id');
    return response;
  }
}
