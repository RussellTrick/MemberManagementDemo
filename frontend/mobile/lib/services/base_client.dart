import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

String? baseUrl = "${dotenv.env['API_BASE_URL']}/api/v1";

class BaseClient {
  var client = http.Client();

  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl! + api);
    var headers = {'Accept': 'application/json'};

    var response = await client.get(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // TODO: Throw exception and catch in UI
      throw Exception('Failed to load data');
    }
  }

  //POST
  Future<dynamic> post(String api, Map<String, dynamic> data) async {
    var url = Uri.parse(baseUrl! + api);
    var headers = {'Content-Type': 'application/json'};

    var response =
        await client.post(url, headers: headers, body: json.encode(data));
    if (response.statusCode == 201) {
      return response.body;
    } else {
      // TODO: Throw exception and catch in UI
      throw Exception('Failed to post data');
    }
  }

  //PUT
  Future<dynamic> put(String api, Map<String, dynamic> data) async {
    var url = Uri.parse(baseUrl! + api);
    var headers = {'Content-Type': 'application/json'};

    var response =
        await client.put(url, headers: headers, body: json.encode(data));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // TODO: Throw exception and catch in UI
      throw Exception('Failed to put data');
    }
  }

  //DELETE
  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseUrl! + api);
    var headers = {'Content-Type': 'application/json'};

    var response = await client.delete(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // TODO: Throw exception and catch in UI
      throw Exception('Failed to delete data');
    }
  }
}
