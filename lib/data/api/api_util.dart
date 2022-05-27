import 'package:example_contact_app/data/api/services/contact_service.dart';
import 'package:example_contact_app/data/mapper/contacts_mapper.dart';

import '../../domain/models/contact.dart';

// Использую http, потому что очень простое апи
class ApiUtil {

  static final ApiUtil _singleton = ApiUtil._internal();

  factory ApiUtil() {
    return _singleton;
  }

  ApiUtil._internal();

  final _contactService = ContactService();

  Future<List<Contact>> fetchContacts() async {
    final apiContacts = await _contactService.fetchContacts();
    return ContactMapper.listContactsFromApi(apiContacts);
  }

  Future<Contact?> fetchContact({required String id}) async {
    final apiContact = await _contactService.fetchContact(id);
    if(apiContact != null) {
      return ContactMapper.fromApi(apiContact);
    }
    return null;
  }
}