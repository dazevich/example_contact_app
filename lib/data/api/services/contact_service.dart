import 'dart:convert';

import 'package:example_contact_app/data/api/model/api_contact.dart';
import 'package:http/http.dart' as http;

class ContactService {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<Iterable<ApiContact>> fetchContacts() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode != 200) {
      throw Exception('bad request: ${response.body}');
    }
    final rawContacts =
        (json.decode(utf8.decode(response.bodyBytes)) as List<dynamic>);
    final result =
        rawContacts.map((jsonData) => ApiContact.fromJson(jsonData));
    return result;
  }

  Future<ApiContact?> fetchContact(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('bad request: ${response.body}');
    }
    final rawContact = json.decode(utf8.decode(response.bodyBytes));
    return ApiContact.fromJson(rawContact);
  }
}
