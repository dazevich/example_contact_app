import 'package:example_contact_app/domain/providers/contacts_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presentation/contacts/contacts_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ContactsPageProvider()),
      ],
      child: const Scaffold(
        body: SafeArea(
          child: ContactsPage()
        ),
      ),
    );
  }
}
