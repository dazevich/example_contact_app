import 'package:example_contact_app/domain/models/contact.dart';
import 'package:flutter/cupertino.dart';

class ContactsPageProvider extends ChangeNotifier {
  String? _fillter;

  void setFilter(String filter) {
    if(filter.isEmpty) {
      _fillter = null;
    } else {
      _fillter = filter;
    }
    notifyListeners();
  }

  Iterable<Contact> mapWithFillter(List<Contact> list) => list.where((contact){
    if(_fillter != null) {
      final conditions = <bool>[
        contact.name.contains(_fillter!),
        contact.company.name.contains(_fillter!),
        contact.username.contains(_fillter!),
        contact.website.contains(_fillter!),
        contact.email.contains(_fillter!),
        contact.phone.contains(_fillter!),
      ];
      return conditions.contains(true);
    }
    return true;
  });
}