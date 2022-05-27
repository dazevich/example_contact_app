import 'package:example_contact_app/data/api/api_util.dart';
import 'package:example_contact_app/presentation/contacts/components/search_contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/models/contact.dart';
import '../../domain/providers/contacts_page_provider.dart';
import 'components/contact_view.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchContactInput(),
            FutureBuilder<List<Contact>>(
                future: ApiUtil().fetchContacts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: context
                          .watch<ContactsPageProvider>()
                          .mapWithFillter(snapshot.data!)
                          .map((e) => ContactView(contact: e))
                          .toList(),
                    );
                  }
                  return Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: CircularProgressIndicator());
                }),
          ],
        ),
      ),
    );
  }
}
