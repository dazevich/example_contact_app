import 'package:example_contact_app/data/api/model/api_contact.dart';
import 'package:example_contact_app/domain/models/contact.dart';

class ContactMapper {
  static Contact fromApi(ApiContact apiContact) => Contact(
      id: apiContact.id,
      name: apiContact.name,
      username: apiContact.username,
      email: apiContact.email,
      phone: apiContact.phone,
      website: apiContact.website,
      address: Address(
          street: apiContact.street,
          suite: apiContact.suite,
          city: apiContact.city,
          zipCode: apiContact.zipCode,
          geo: apiContact.geo),
      company: Company(
          name: apiContact.companyName,
          catchPhrase: apiContact.catchPhrase,
          bs: apiContact.bs));

  static List<Contact> listContactsFromApi(
      Iterable<ApiContact> listApiContacts) {
    return listApiContacts.map(fromApi).toList();
  }
}
